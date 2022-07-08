SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("M:\Media\video\Super8\1982-skola\N8 film.mov")
assumefps(18)

full = last

crop(210, 80, -50, -92)
#crop(210, 80, -10, -92)

w = width
h = height
w = w*900/h
h = 900
gaussResize(w, h)
#return last.autolevels(filterRadius=0, border_l = 100, ignore_high=0.003).histogram("levels").Prefetch

# 0, 79, 186, 317, 505, 635, 793, 872, 962, 1023, 1164, 1279, 1363, 1493, 1554, 1741, 2154, 2314, 2435, 2657, 2853, 3007,
# 3347, 3547, 3777, 3966, 4058, 4173, 4473, 4864, 5013, 5057, 5076, 5297, 5637, 5643, 5840, 5908, 6065, 6156, 6201, 6383,
# 6608, 6806, 6859, 7001, 7027, 7525, 7535, 7635, 7767, 7772, 7841, 7966, 8249, 8439, 8725, 8808, 8894, 9038, 9224, 9393,
# 9560, 9721, 9841, 9936, 10049, 10226, 10496, 10757, 10798, 11000, 11182, 11570, 11604, 11913, 12377, 12428, 12556, 12732, # 80
# 12741, 12767, 12780, 12822, 12876, 12921, 12931, 13005, 13025, 13102, 13133, 13161, 13254, 13277, 13291, 13373, 13476, # 97, 17 per col.
# 13547, 13631, 13697, 13820, 13856, 13919, 13963, 13989, 14013, 14074, 14115, 14168, 14307, 14470, 14514, 14751, 14973, # 114
# 15136, 15203, 15274, 15486, 15650, 15838, 16278, 16428, 16671, 16958, 17123, 17453, 17723, 17972, 18045, 18539, 18590, # 131
# 19130, 19248, 19534, 19699, 19819, 20222, 20331, 20750, 21109, 21161, 21232, 21282, 21410, 21634, 21932, 22282, 22734, # 148
# 22753, 23236, 23370, 23443, 23664, 23720, 23832, 24000, 24019, 24143, 24324, 24443, 24450, 24522, 24550, 24668, 24701, # 165
# 24807, 24938, 25193, 25267, 25343, 25487, 25725, 26121, 26309, 26390, 26932, 27473, 27569, 27624
#
# skipped
# (7525, 7534)
# (7767, 7771)
# (12921, 12930)
# (13133, 13160)
# (13277, 13290)
# (24443, 24449)

global src = last
#return last.autolevels(minRng=0, filterRadius=0)
#return full

ref_left = 180 + 18
ref_right = -30 + 2
ref_top = 110
ref_bot = -92

left = ref_left
right = ref_right
top = ref_top
bot = ref_bot

full = full.stackHorizontal(full.crop(full.width - 16, 0, 0, 0))

left = ref_left
right = ref_right
top = ref_top
bot = ref_bot

v161 = full.trim(24938, 25192)
v161 = v161.crop(left + 60, top - 10, right - 48, bot - 24)

v162 = full.trim(25193, 25265)
v162 = v162.animate(57, 61, "crop", left + 60, top - 10, right - 38, bot - 24, left + 80, top - 10, right - 18, bot - 24).trim(0, 61) +\
       v162.animate(61, 64, "crop", left + 80, top - 10, right - 18, bot - 24, left + 60, top - 10, right - 38, bot - 24).trim(62, 64) +\
       v162.animate(64, 66, "crop", left + 60, top - 10, right - 38, bot - 24, left + 0, top - 10, right - 98, bot - 24).trim(64, 0)

v163 = full.trim(25270, 25342)
v163 = v163.animate(0, 2, "crop", left + 54, top - 0, right - 44, bot - 14, left + 64, top - 0, right - 34, bot - 14).trim(0, 2) +\
       v163.animate(3, 9, "crop", left + 64, top - 0, right - 34, bot - 14, left + 40, top - 0, right - 58, bot - 14).trim(3, 0)

v164 = full.trim(25343, 25486)
v164 = v164.crop(left + 40, top - 0, right - 68, bot - 14)

v165 = full.trim(25487, 25724)
v165 = v165.crop(left + 40, top - 10, right - 58, bot - 24)

v166 = full.trim(25726, 26120)
v166 = v166.crop(left + 40, top - 20, right - 58, bot - 34)

v167 = full.trim(26121, 26308)
v167 = v167.crop(left + 40, top - 20, right - 58, bot - 34)

v168 = full.trim(26309, 26389)
v168 = v168.crop(left + 40, top - 20, right - 58, bot - 34)

v169 = full.trim(26390, 26931)
v169 = v169.crop(left + 40, top - 20, right - 58, bot - 34)

v170 = full.trim(26932, 27472)
v170 = v170.crop(left + 40, top - 20, right - 58, bot - 34)

v171 = full.trim(27474, 27568)
v171 = v171.crop(left + 40, top - 20, right - 58, bot - 34)

v172 = full.trim(27573, 27624)
v172 = v172.crop(left + 50, top - 20, right - 48, bot - 34)

#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).info.prefetch
#return v172.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch(4)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 161

v161 = LWLibavVideoSource(source_dir + "v161f.avi", cache=false).ConvertToYV24()
v161 = v161.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v161 = v161.colorYUV(off_u=-4, off_v=4)
v161 = v161.adjustSize
v161 = v161.assumeFPS(18)
return v161.prefetch
#adjustframerate

v162 = LWLibavVideoSource(source_dir + "v162f.avi", cache=false).ConvertToYV24()
v162 = v162.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v162 = v162.colorYUV(off_u=-4, off_v=4)
v162 = v162.adjustSize
v162 = v162.assumeFPS(18)
return v162.prefetch
#adjustframerate

v163 = LWLibavVideoSource(source_dir + "v163f.avi", cache=false).ConvertToYV24()
v163 = v163.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v163 = v163.colorYUV(off_u=-4, off_v=4)
v163 = v163.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v163 = v163.adjustSize
v163 = v163.assumeFPS(18)
return v163.prefetch
#adjustframerate

v164 = LWLibavVideoSource(source_dir + "v164f.avi", cache=false).ConvertToYV24()
v164 = v164.AdjustColor(ou=10, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v164 = v164.colorYUV(off_u=-4, off_v=4)
v164 = v164.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v164 = v164.adjustSize
v164 = v164.assumeFPS(18)
return v164.prefetch
#adjustframerate

v165 = LWLibavVideoSource(source_dir + "v165f.avi", cache=false).ConvertToYV24()
v165 = v165.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v165 = v165.colorYUV(off_u=-4, off_v=4)
v165 = v165.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v165 = v165.adjustSize
v165 = v165.assumeFPS(18)
return v165.prefetch
#adjustframerate

v166 = LWLibavVideoSource(source_dir + "v166f.avi", cache=false).ConvertToYV24()
v166 = v166.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v166 = v166.colorYUV(off_u=-4, off_v=4)
v166 = v166.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.9)
v166 = v166.adjustSize
v166 = v166.assumeFPS(18)
return v166.prefetch
#adjustframerate

v167 = LWLibavVideoSource(source_dir + "v167f.avi", cache=false).ConvertToYV24()
v167 = v167.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v167 = v167.colorYUV(off_u=-8, off_v=0)
v167 = v167.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v167 = v167.adjustSize
v167 = v167.assumeFPS(18)
return v167.prefetch
#adjustframerate

v168 = LWLibavVideoSource(source_dir + "v168f.avi", cache=false).ConvertToYV24()
v168 = v168.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v168 = v168.colorYUV(off_u=-8, off_v=0)
v168 = v168.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v168 = v168.adjustSize
v168 = v168.assumeFPS(18)
return v168.prefetch
#adjustframerate

v169 = LWLibavVideoSource(source_dir + "v169f.avi", cache=false).ConvertToYV24()
v169 = v169.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v169 = v169.colorYUV(off_u=-8, off_v=0)
v169 = v169.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v169 = v169.adjustSize
v169 = v169.assumeFPS(18)
return v169.prefetch
#adjustframerate

v170 = LWLibavVideoSource(source_dir + "v170f.avi", cache=false).ConvertToYV24()
v170 = v170.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v170 = v170.colorYUV(off_u=-8, off_v=0)
v170 = v170.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v170 = v170.adjustSize
v170 = v170.assumeFPS(18)
return v170.prefetch
#adjustframerate

v171 = LWLibavVideoSource(source_dir + "v171f.avi", cache=false).ConvertToYV24()
v171 = v171.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v171 = v171.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v171 = v171.adjustSize
v171 = v171.assumeFPS(18)
return v171.prefetch
#adjustframerate

v172 = LWLibavVideoSource(source_dir + "v172f.avi", cache=false).ConvertToYV24()
#v172_ = LWLibavVideoSource(source_dir + "v172s.avi", cache=false).ConvertToYV24()
#return v172_.interleave(v172).histogram("levels")
#v172 = v172.colorYUV(off_y=6)
#v172 = v172.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v172 = v172.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v172 = v172.colorYUV(off_u=-12, off_v=0)
v172 = v172.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v172 = v172.adjustSize
v172 = v172.assumeFPS(18)
#return v172.histogram("levels").prefetch
return v172.prefetch
#adjustframerate

#******

*/

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

function Curves(clip c, string "bluePoints")
{
    return StrLen(bluePoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "bluePoints", float "sat")
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
    sat = Default(sat, 1)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints = bluePoints).\
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
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}

function gamma(clip c, int "gamma")
{
    return c.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=gamma/1000.0)
}

function color_uv(clip c, int off_u, int off_v)
{
    return c.colorYUV(off_u = off_u, off_v = off_v)
}

/*
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/
