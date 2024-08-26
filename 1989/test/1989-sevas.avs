SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LSMASHVideoSource("F:Media\video\Super8\Sources\1989\1 část - Res2K43.Aspect43In43.Speed18Fps.mov")
assumefps(18)

full = last

crop(94, 110, -98, -122)

w = width
h = height
w = w*1080/h + 1
h = 1080

v6969 = trim(5116, 5447)
va = BlankClip(v6969, audio_rate = 48000, channels = 2).killVideo
v6969 = v6969.audioDub(va)
return v6969.adjustSize
v1 = v6969
v1 = v1.autolevels(filterRadius=0, minRng=0, border_l=100, border_t=100, border_r=100, border_b=100, ignore_low=0.03, ignore_high=0.03).\
        colorYUV(autowhite = true).gaussResize(w, h, p = 1).convertToYV12.UnsharpMask(strength=500, radius=5, threshold=1)

v2 = v6969
v2 = v6969.autolevels(output_low = 0, output_high = 255, input_low = 50, input_high = 230, autolevel = false)
v2 = v2.\
        convertToYV12.deSpot(pwidth=500, pheight=500, mthres=50, sign=0, p1=40, p2=10, color=true, show=0).\
        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
        /*removeDirt.*/\
        /*autolevels(filterRadius=0, minRng=0, border_l=100, border_t=100, border_r=100, border_b=100, ignore_low=0.03, ignore_high=0.03).*/\
        /*colorYUV(autowhite = true).*/rotate(-3.)
v2 = v2.crop(78, 0, 0, -56)#.adjustBorders
v2 = v2.gaussResize(w, h, p = 1).convertToYV12.UnsharpMask(strength=500, radius=5, threshold=1)

v3 = v6969.autolevels(output_low = 0, output_high = 255, input_low = 50, input_high = 230, autolevel = false)
v3 = v3.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
        deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45).\
        /*removeDirt.*/\
        /*autolevels(filterRadius=0, minRng=0, border_l=100, border_t=100, border_r=100, border_b=100, ignore_low=0.0003, ignore_high=0.0003).*/\
        /*colorYUV(autowhite = true).*/rotate(-3.)
# slope 3.
v6969 = v3
expY = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
expM = "sx 950 < sy 950 sx - 19 / 10 + < & 255 x ?"
expMt = "sx 950 < sy 950 sx - 19 / 10 + < & 255 0 ?"
expC = "sx 950 < sy 950 sx - 19 / 00 + < & x[0,48] x ?"
v6969 = v6969.expr(v6969, expY, expC, expC)
exp = "sy 680 < width sx - 680 sy - 19 / 10 + < & x[-36,0] x ?"
v6969 = v6969.expr(exp, exp, exp)
exp = "width sx - 950 < height sy - 950 width sx - - 19 / 10 + < & x[0,-48] x ?"
v6969 = v6969.expr(exp, exp, exp)
exp = "height sy - 680 < sx 680 height sy - - 19 / 10 + < & x[36,0] x ?"
v6969 = v6969.expr(exp, exp, exp)

v6969_mYV = v6969.extractY.expr(expMt).convertToYV24
v6969_m = v6969_mYV.gaussResize(v6969.width/8, v6969.height/8).gaussResize(v6969.width, v6969.height)
v6969b = v6969.gaussResize(v6969.width/16, v6969.height/16).gaussResize(v6969.width, v6969.height)
v6969 = v6969.mt_merge(v6969b, v6969_m, luma = true)
v6969 = v6969.crop(78, 0, 0, -56)#.adjustBorders

v3 = v6969
v3 = v3.gaussResize(w, h, p = 1).convertToYV12.UnsharpMask(strength=500, radius=5, threshold=1)

#v6969 = v6969.deScratch(mindif = 1, asym = 255, maxwidth = 15, minlen = 100, maxlen = 4096, maxangle = 45)
#return v6969.prefetch

#return v3.interleave(v2).prefetch

# 8, 52, 91, 147, 182, 203, 256, 307, 348, 391, 418, 452, 494, 550, 582, 621, 691, 758, 788, 792, 830, 871, 920, 979, 1015, 1076,
# 1126, 1252, 1329, 1407, 1497, 1625, 1717, 1799, 1867, 1914, 1958, 2052, 2121, 2182, 2246, 2290, 2329, 2442, 2479, 2517, 2585,

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

v1 = full.trim(8, 51).crop(36, 88, -50, -60)
v2 = full.trim(52, 90).crop(36, 88, -50, -60)
v3 = full.trim(91, 146).crop(36, 88, -50, -60)
v4 = full.trim(147, 181).crop(36, 88, -70, -60)
v5 = full.trim(182, 202).crop(36, 88, -70, -60)
v6 = full.trim(203, 255).crop(36, 88, -50, -60)
v7 = full.trim(256, 306).crop(36, 88, -50, -60)
v8 = full.trim(307, 347).crop(36, 88, -50, -60)
v9 = full.trim(348, 390).crop(36, 88, -50, -60)
v10 = full.trim(391, 417).crop(36, 88, -50, -60)
v11 = full.trim(418, 451).crop(36, 88, -50, -60)
v12 = full.trim(452, 493).crop(36, 88, -50, -60)
v13 = full.trim(494, 549).crop(36, 88, -50, -60)
v14 = full.trim(550, 581).crop(36, 88, -50, -60)
v15 = full.trim(582, 620).crop(36, 88, -50, -60)
v16 = full.trim(621, 690).crop(36, 88, -50, -60)
v17 = full.trim(691, 757).crop(36, 88, -50, -60)
v18 = full.trim(758, 787).crop(36, 88, -50, -60)
#v19 = full.trim(788, 791).crop(36, 88, -50, -60)
v19 = full.trim(792, 829).crop(40, 98, -50, -60)
v20 = full.trim(830, 870).crop(36, 88, -50, -60)
v21 = full.trim(871, 919).crop(36, 88, -50, -60)
v22 = full.trim(920, 978).crop(36, 88, -50, -60)
v23 = full.trim(979, 1014).crop(36, 88, -50, -60)
v24 = full.trim(1015, 1075-15).crop(36, 88, -50, -60)
v25 = full.trim(1076+3, 1125).crop(36, 88, -50, -60)
v26 = full.trim(1126, 1251).crop(36, 88, -50, -60)
v27 = full.trim(1252+5, 1328).crop(36, 88, -50, -60)
v28 = full.trim(1329, 1406).crop(36, 88, -50, -60)
v29 = full.trim(1407, 1495).crop(36, 88, -50, -60)
v30 = full.trim(1497, 1624-20).crop(44, 88, -50, -60)
v31 = full.trim(1625, 1716).crop(44, 88, -50, -60)
v32 = full.trim(1717, 1798-15).crop(44, 88, -50, -60)
#return v19.adjustSize.adjustBorders

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

#import("common.avs")

#******

# 1

#******

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

function adjustSize(clip c)
{
    w = c.width
    h = c.height
    w = w*1080/h
    w = (w % 2 == 0) ? w : w + 1
    h = 1080

    return c.gaussResize(w, h)
}

function Curves(clip c, string "bluePoints", string "greenPoints")
{
    return StrLen(bluePoints) == 0 && StrLen(greenPoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints, greenPoints=greenPoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac",\
                     string "bluePoints", string "greenPoints", float "sat")
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
    bluePoints = Default(bluePoints, "")
    greenPoints = Default(greenPoints, "")
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints=bluePoints, greenPoints=greenPoints).\
       ConvertToYV24() : c

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

function AdjustFrameRate(clip c, string "preset_p", string "output_p", int "blksize_p",\
                         int "Dct", int "DctRe", int "MaskThr", int "MaskOcc", int "SkipThr", bool "Stp", int "BlendRatio")
{
    preset_p = Default(preset_p, "Slow")
    output_p = Default(output_p, "Flow")
    blksize_p = Default(blksize_p, 12)
#    c = c.Histogram("levels").info
    c = c.FrameRateConverter(Output=output_p, Preset=preset_p, NewNum=24, NewDen=1,\
                             blksize=blksize_p, Dct=Dct, DctRe=DctRe, MaskThr=MaskThr,\
                             MaskOcc=MaskOcc, SkipThr=SkipThr, Stp=Stp, BlendRatio=BlendRatio)#, stp=false)
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
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=false), input, mode=repmode, modeU = _grey ? -1 : repmode )
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
#	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, noise=20, noisy=60, grey=_grey)
#    return clensed.crop(0,0,-dw,-dh)
    return corrected.crop(0,0,-dw,-dh)
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode ).crop(0,0,-dw,-dh)
}
/*
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/