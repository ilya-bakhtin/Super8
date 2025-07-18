global filter16 = true

function hist_levels(clip c)
{
    hist = c.histogram("levels", keepsource = false)
    return hist.addBorders(0, 0, 0, c.height - hist.height).stackHorizontal(c)
}

function color_yuv(clip c, float off_u, float off_v)
{
    return c.colorYUV(off_u = off_u, off_v = off_v)
}

function adjustBorders(clip c)
{
    ref_w = src.width
    ref_h = src.height
    ref_w = ref_w*1080/ref_h
    rem = ref_w % 16
    ref_w = (rem == 0) ? ref_w : ref_w + 16 - rem
    ref_h = 1080

    w = c.width
    h = c.height
    w = w*1080/h
    h = 1080

    c = c.height == h ? c : c.spline64Resize(w, h)

    assert(ref_w >= w, "ref_w < w")

    return ref_w == w ? c : c.addBorders(0, 0, ref_w - w, 0)
}

function adjustSize(clip c, float "sharpness")
{
    sharpness = default(sharpness, 10.)

    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

    return c.height == h ? c : c.gaussResize(w, h, p = sharpness)
}

function Curves(clip c, string "bluePoints", string "redPoints")
{
    return StrLen(bluePoints) == 0 && StrLen(redPoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints, redPoints=redPoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "redPoints", string "bluePoints",\
                     float "sat_0", float "sat",\
                     string "r_expr", string "g_expr", string "b_expr")
{
    ou = Default(ou, 0)
    ov = Default(ov, 0)
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)
    x = Default(x, 20)
    y = Default(y, 20)
    w = Default(w, -20)
    h = Default(h, -20)
    lo_th = Default(lo_th, 0)
    hi_th = Default(hi_th, 0.1)
    scale = Default(scale, 2)
    gam_mac = Default(gam_mac, true)
    lock_chan = Default(lock_chan, 1)
    redPoints = Default(redPoints, "")
    bluePoints = Default(bluePoints, "")
    sat = Default(sat, 1)
    sat_0 = Default(sat_0, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()
    c = sat_0 == 1 ? c : c.tweak(sat=sat_0, coring=false)
/*
    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(redPoints = redPoints, bluePoints = bluePoints).\
       ConvertToYV24() : c
*/
    if (gam_mac)
    {
        c = c.ConvertToRGB().\
            GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
            Curves(redPoints = redPoints, bluePoints = bluePoints)
#        c = c.ConvertToPlanarRGBA
/*
b > r && b > g && b - r > 0.5 && b - g > 0.5 ? b = (r + g) / 2 : b
*/
#        c = Expr(c.ExtractR, c.ExtractG, c.ExtractB, "x", "y", "z x > z y > & z x - 0.5 > z y - 0.5 > & x y + 2 / z ? z ?", format = "RGBP")
        re = defined(r_expr)
        ge = defined(g_expr)
        be = defined(b_expr)
        if (re || ge || be)
        {
            c = Expr(c.ExtractR, c.ExtractG, c.ExtractB, (re ? r_expr : "x"), (ge ? g_expr : "y"), (be ? b_expr : "z"), format = "RGBP")
        }
#        c = c.histogram("levels")
        c = c.ConvertToYV24()
    }
    c = sat == 1 ? c : c.tweak(sat=sat, coring=false)

#    c = c.AdjustDiv2(1, 2)

    return c
}

function AdjustColorWB(clip c, y_gamma)
{
    c = c.tweak(sat=0, coring=false)
    c = c.Filter()
    c = c.ColorYUV(autogain=true, gamma_y = y_gamma)

    return c
}

function Filter_0(clip c)
{
    bsize = 8
    over = 4
    chrom = true
    hp = 16
    vp = 16
    search_v = 3
    dct_v = 1

    super = c.MSuper(pel=1, sharp=1, hpad=hp, vpad=vp, rfilter=4)
#return super.info

    backward_vec1 = MAnalyse(super, isb = true, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec2 = MAnalyse(super, isb = true, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    backward_vec3 = MAnalyse(super, isb = true, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec1 = MAnalyse(super, isb = false, delta = 1, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec2 = MAnalyse(super, isb = false, delta = 2, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
    forward_vec3 = MAnalyse(super, isb = false, delta = 3, blksize=bsize, overlap=over, chroma=chrom, search=search_v, dct=dct_v)
#    return c.MDegrain2(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,thSAD=4000)
    return c.MDegrain3(super, backward_vec1,forward_vec1,backward_vec2,forward_vec2,backward_vec3,forward_vec3,thSAD=400)
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c", int "dct", int "tr", bool "RefineMotion", bool "contrasharp",\
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter", float "fft_sharp")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)
    dct = default(dct, 0)
    tr = default(tr, 9)
    RefineMotion = default(RefineMotion, true)
    contrasharp = default(contrasharp, true)
    truemotion = default(truemotion, true)
    fft_sharp = default(fft_sharp, 0)

    new_w = (c.width + 15) / 16
    new_w = new_w * 16
    new_h = (c.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - c.height
    dw = new_w - c.width
    c = c.addBorders(0, 0, dw, dh)

    c = filter16 ? c.convertBits(16) : c
#c = c.Spline64Resize(960, 720)
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, prefilter=prefilter, contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = (sigma_y == 0 && fft_sharp == 0) ?\
                       c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6, sharpen=fft_sharp)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

#c = c.SincResize(1440, 1080)
    c = filter16 ? c.convertBits(8) : c

    return c.crop(0,0,-dw,-dh)
}

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1, blksize=blksize_p)#, Dct=1, DctRe=1)#, stp=false)
    return c
}

function RemoveDirt(clip input, bool "_grey", int "repmode")
{
    new_w = (input.width + 15) / 16
    new_w = new_w * 16
    new_h = (input.height + 15) / 16
    new_h = new_h * 16
    dh = new_h - input.height
    dw = new_w - input.width
    input = input.addBorders(0, 0, dw, dh)

    _grey=default(_grey, false)
	repmode=default(repmode, 16)
	clmode=17
	clensed=Clense(input, grey=_grey, cache=4)
	sbegin = ForwardClense(input, grey=_grey, cache=-1)
	send = BackwardClense(input, grey=_grey, cache=-1)
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=true), input, mode=repmode, modeU = _grey ? -1 : repmode )
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
    return corrected.crop(0,0,-dw,-dh)
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode ).crop(0,0,-dw,-dh)
}

function gamma(clip c, int "gamma")
{
    return c.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=gamma/1000.0)
}

function gamma_f(clip c, float "gamma")
{
    return c.autolevels(filterRadius = 0, minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=gamma)
}

function gamma_f_dr(clip c, float "gamma")
{
    return c.autolevels(minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}

function color_uv(clip c, int off_u, int off_v)
{
    return c.colorYUV(off_u = off_u, off_v = off_v)
}

function offset_y(clip c, int off_y)
{
    return c.colorYUV(off_y = off_y)
}

function PrepareMask(clip c, int "off_y", float "ignore_low", float "ignore_high",\
                     int "mask_tolerance", int "border_r", int "border_b", int "mask_w", int "mask_h",\
                     int "dw1", int "dh1")
{
    mask_w = default(mask_w, 192)
    mask_h = default(mask_h, 128)

    off_y=default(off_y, 0)
    ignore_low=default(ignore_low, 0.2)
    ignore_high=default(ignore_high, 0.1)
    mask_tolerance=default(mask_tolerance, 100)
    border_r=default(border_r, 0)
    border_b=default(border_b, 0)

#    c = c.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%

#mask_hs = c.crop(0, 0, mask_w, mask_h).maskHS(minSat = 0, maxSat = 8, realcalc = true)
#return c.crop(0, 0, mask_w, mask_h).extractV.ConvertToPlanarRGBA().resetMask.ColorKeyMask($808080, 10).\
#       Invert("A").showAlpha.convertToRGB32
#return c.crop(0, 0, mask_w, mask_h).extractU.ConvertToPlanarRGBA().resetMask.ColorKeyMask($808080, 10).\
#       Invert("A").showAlpha.convertToRGB32

    mask = c.crop(0, 0, mask_w, mask_h).\
             colorYUV(off_y = off_y, autowhite=true).extractY.\
             autoLevels(ignore_low=ignore_low, ignore_high=ignore_high, filterRadius=0, minRng=0, border_r=border_r, border_b=border_b, debug=false)
#return mask
    mask = mask.addBorders(0, 0, c.width - mask_w, c.height - mask_h)
    mask = mask.letterbox(0, c.height - mask_h, 0, c.width - mask_w, color = $ffffff)
    mask = mask.ConvertToPlanarRGBA()
#return mask
    mask = mask.expr("sx 40 < sy 0 == & 0 x ?")
#return mask.ConvertToRGB32
    mask = mask.Blur(1.5).Blur(1.5).Blur(1.5)
    mask = mask.ColorKeyMask($000000, mask_tolerance).Invert("A").showAlpha.convertToRGB32
#return mask.crop(0,0,mask_w,mask_h).stackVertical(mask_hs.convertToRGB32)

    mask = mask.MaskUpdate(mask_w = mask_w, mask_h = mask_h)
#return mask
    dw = 600 #440 #288
    dh = 450 #330 #216
    mask = mask.Spline64Resize(c.width + dw, c.height + dh)#.crop(0, 0, -288, -216) # 120%

    dw1 = default(dw1, 20)
    dh1 = default(dh1, 15)
    mask = mask.crop(dw1, dh1, 0, 0).addBorders(0, 0, dw1, dh1)
    mask = mask.Blur(1.5)
    mask = mask.MaskUpdate(mask_w = mask_w * (c.width + dw)/c.width, mask_h = mask_h * (c.width + dw)/c.width).crop(0, 0, -dw, -dh)
    return mask
}

function add_blank_audio(clip v)
{
    a = BlankClip(v, audio_rate = 48000, channels = 2).killVideo
    v = v.audioDub(a)
    return v
}

global g_expr_add_mask_for_blur = ""
global g_expr_replace_mask_for_copy = ""

function fill_wedges(clip c, float "a", int "t_dh", int "r_dw", int "b_dh", int "l_dw")
{
    t_dh = default(t_dh,  0) # intentionally since will be blurred
    r_dw = default(r_dw, 10)
    b_dh = default(b_dh, 10)
    l_dw = default(l_dw, 10)

    t_dh_s = Format("{}", t_dh)
    r_dw_s = Format("{}", r_dw)
    b_dh_s = Format("{}", b_dh)
    l_dw_s = Format("{}", l_dw)

    tg = tan(a/180.*pi())
    w = c.width/2. - c.height/2.*tan(a/2./180.*pi())
    h = w*tg

    w_s = Format("{}", w)
    ih_s = Format("{}", int(round(h)))
    tg_s = Format("{}", tg)

#   expM = "sx 950 < sy 950 sx - 19 / 30 + < & 255 x ?"
    global g_expr_add_mask_for_blur = "sx " + w_s + " < sy " + w_s + " sx - " + tg_s + " * " + t_dh_s + " + 10 + < & 255 x ?"
#   expMt = "sx 950 < sy 950 sx - 19 / 30 + < & 255 0 ?"
    global g_expr_replace_mask_for_copy = "sx " + w_s + " < sy " + w_s + " sx - " + tg_s + " * 10 + < & 255 0 ?"
     
#   expY = "sx 950 < sy 950 sx - 19 / 10 + < & x[0,48] x ?"
    expY = "sx " + w_s + " < sy " + w_s + " sx - " + tg_s + " * " + t_dh_s + " + < & x[0," + ih_s + "] x ?"
    expC = expY
    c = c.expr(expY, expC, expC)

#   exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
    exp = "width sx - " + w_s + " < height sy - " + w_s + " width sx - - " + tg_s + " * " + b_dh_s + " + < & x[0,-" + ih_s + "] x ?"
    c = c.expr(exp, exp, exp)

    h = c.height/2. - c.width/2.*tan(a/2./180.*pi())
    w = h*tg
    h_s = Format("{}", h)
    iw_s = Format("{}", int(round(w)))

#   exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
    exp = "sy " + h_s + " < width sx - " + h_s + " sy - " + tg_s + " * " + r_dw_s + " + < & x[-" + iw_s + ",0] x ?"
    c = c.expr(exp, exp, exp)

#   exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
    exp = "height sy - " + h_s + " < sx " + h_s + " height sy - - " + tg_s + " * " + l_dw_s + " + < & x[" + iw_s + ",0] x ?"
    c = c.expr(exp, exp, exp)

    return c
}

function prepare_solid_mask(clip c, int "w", int "h", int "r")
{
    r = default(r, 40)

    w_s = Format("{}", w)
    h_s = Format("{}", h)
    r_s = Format("{}", r)

#   exp = "160 mw^ 170 mh^ 40 rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
    exp = w_s + " mw^ " + h_s + " mh^ " + r_s + " rr^ mw rr - mwr^ mh rr - mhr^ sx mw < sy mh < & sx mwr < sy mhr < | sx mwr - dup * sy mhr - dup * + rr rr * < | & 255 0 ?"
    return c.trim(0, -1).extractY.expr(exp).convertToYV24
}

function deScratchBlock(clip c, clip "in_mask", clip "in_block", int "x", int "w", int "y", int "h",\
                        int "minlen", int "blurlen", float "maxangle", bool "slope", int "ratio")
{
    x = default(x, 1110)
    w = default(w, 90)
    y = default(y, 0)
    h = default(h, 280)
    minlen = default(minlen, 10)
    blurlen = default(blurlen, 6)
    maxangle = default(maxangle, 45)
    slope = default(slope, true)
    ratio = default(ratio, 1)

    c = c.extractY.convertToYV24

    b = c.crop(x, y, w, h)
    if (ratio != 1 && !slope && !defined(in_mask) && !defined(in_block))
    {
        b = b.spline64Resize(w/ratio, h/ratio)
    }
    
    mask = BlankClip(b) #length = v92.frameCount, width = v92.width, height = v92.height, pixel_type="YV12")
    if (slope)
    {
        m_r = mask.mt_lutspa(mode="relative", expr="x 0.6 - y 0.5 * - 10 * 256 *", chroma="-128")
        m_l = mask.mt_lutspa(mode="relative", expr="y 0.5 * x 0.1 - - 10 * 256 *", chroma="-128")
        mask = m_r.mt_logic(m_l, mode = "or")
    }
    else
    {
        if (defined(in_mask))
        {
            mask = in_mask
            w = mask.width
            h = mask.height
        }
        else
        {
            mask = mask.mt_lutspa(mode="relative", expr="0", chroma="-128")
        }
    }

    if (defined(in_block))
    {
        in_block = in_block#.colorYUV(off_y = 20)
        b = in_block.mt_merge(b, mask, luma = true)
    }
    else
    {
        b_ds = b.deScratch(mindif = 1, asym = 10, maxwidth = 15, minlen = minlen, maxlen = 600,\
                           blurlen = blurlen, maxangle = maxangle, modeY = 1)#.colorYUV(off_y = 20)
        if (ratio != 1 && !slope && !defined(in_mask) && !defined(in_block))
        {
            b = b.spline64Resize(w, h)
            b_ds = b_ds.spline64Resize(w, h)
        }
        b = b_ds.mt_merge(b, mask, luma = true)
    }
 #b = mask
#    cds = c.crop(0, 0, x, h).stackHorizontal(b).stackHorizontal(c.crop(x + w, 0, 0, h)).\
#          stackVertical(c.crop(0, h, 0, 0))

    if (y != 0)
    {
        if (x != 0)
        {
            if (y + h < c.height)
            {
                if (x + w < c.width)
                {
                    cds = c.crop(0, 0, 0, y).stackVertical(\
                        c.crop(0, y, x, h).stackHorizontal(b).stackHorizontal(c.crop(x + w, y, 0, h)).\
                            stackVertical(c.crop(0, y + h, 0, 0)))
                }
                else
                {
                    cds = c.crop(0, 0, 0, y).stackVertical(\
                        c.crop(0, y, x, h).stackHorizontal(b).\
                            stackVertical(c.crop(0, y + h, 0, 0)))
                }
            }
            else
            {
                cds = c.crop(0, 0, 0, y).stackVertical(\
                    c.crop(0, y, x, h).stackHorizontal(b).stackHorizontal(c.crop(x + w, y, 0, h)))
            }
        }
        else
        {
            cds = c.crop(0, 0, 0, y).stackVertical(\
                b.stackHorizontal(c.crop(x + w, y, 0, h)).\
                    stackVertical(c.crop(0, y + h, 0, 0)))
        }
    }
    else
    {
        cds = c.crop(0, 0, x, h).stackHorizontal(b).stackHorizontal(c.crop(x + w, 0, 0, h)).\
              stackVertical(c.crop(0, h, 0, 0))

    }
#    return c.interleave(cds)
    return cds
}
