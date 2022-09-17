SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("M:\Media\video\Super8\1982-skola\N8.Res2K43.Aspect43In43.Speed16Fps.mov")
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

# 0, 272, 503, 631, 635, 1046, 1227, 1602, 2046, 2142, 2201, 2236, 2271, 2365, 2690, 2723, 2802, 2990, 3080, 3099, 3147, # 20
# 3173, 3344, 3402, 3487, 3572, 3653, 3709, 3797, 3886, 3983, 4020, 4078, 4130, 4183, 4276, 4295, 4349, 4394, 4468, 4504, # 40, 20 per line
# 4556, 4599, 4661, 4710, 4764, 4879, 4914, 4941, 4981, 5028, 5055, 5112, 5226, 5270, 5336, 5402, 5487, 5542, 5597, 5655, # 60
# 5720, 5845, 5921, 6002, 6067
#
# skip (631, 634)

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

#v32 = full.trim(4078, 4129)
#v32 = v32.crop(left + 16, top + 24, right - 82, bot + 10)

v33 = full.trim(4130, 4182)
v33 = v33.crop(left + 16, top + 24, right - 82, bot + 10)

v34 = full.trim(4183, 4275)
last_f = v34.frameCount - 1
v34 = v34.crop(left + 16, top + 24, right - 82, bot + 10).trim(0, last_f - 2) +\
      v34.crop(left - 4, top + 24, right - 102, bot + 10).trim(last_f - 1, 0)

v35 = full.trim(4276, 4294)
v35 = v35.trim(0, 7) + v35.trim(9, 0)
v35 = v35.crop(left + 6, top + 24, right - 92, bot + 10).trim(0, 1) +\
      v35.crop(left + 16, top + 24, right - 82, bot + 10).trim(2, 13) +\
      v35.crop(left + 8, top + 24, right - 90, bot + 10).trim(14, -1) +\
      v35.crop(left + 0, top + 24, right - 98, bot + 10).trim(15, -1) +\
      v35.crop(left - 10, top + 24, right - 108, bot + 10).trim(16, -1) +\
      v35.crop(left - 20, top + 24, right - 118, bot + 10).trim(17, -1)
v35 = v35.trim(0, -1).colorYUV(off_y = -20) +\
      v35.trim(1, 0)

v36 = full.trim(4297, 4348)
v36 = v36.animate(0, 5, "crop", left + 36, top + 24, right - 62, bot + 10, left + 46, top + 24, right - 52, bot + 10).trim(0, 5) +\
      v36.animate(6, 12, "crop", left + 56, top + 24, right - 42, bot + 10, left + 36, top + 24, right - 62, bot + 10).trim(6, 12) +\
      v36.animate(33, 40, "crop", left + 36, top + 24, right - 62, bot + 10, left + 66, top + 24, right - 32, bot + 10).trim(13, 40) +\
      v36.animate(41, 44, "crop", left + 66, top + 24, right - 32, bot + 10, left - 10, top + 24, right - 108, bot + 10).trim(41, 44) +\
      v36.animate(45, 51, "crop", left - 20, top + 24, right - 118, bot + 10, left - 60, top + 24, right - 158, bot + 10).trim(45, 0)

v37 = full.trim(4350, 4393)
v37 = v37.animate(0, 8, "crop", left + 46, top + 24, right - 52, bot + 10, left + 86, top + 24, right - 12, bot + 10).trim(0, 8) +\
      v37.animate(8, 10, "crop", left + 76, top + 24, right - 22, bot + 10, left + 36, top + 24, right - 62, bot + 10).trim(9, 17) +\
      v37.animate(18, 24, "crop", left + 36, top + 24, right - 62, bot + 10, left + 26, top + 24, right - 72, bot + 10).trim(18, 0)

v38 = full.trim(4394, 4467)
v38 = v38.animate(2, 5, "crop", left + 26, top + 24, right - 72, bot + 10, left + 40, top + 24, right - 58, bot + 10).trim(0, 5) +\
      v38.animate(5, 9, "crop", left + 40, top + 24, right - 58, bot + 10, left + 30, top + 24, right - 68, bot + 10).trim(6, 14) +\
      v38.animate(15, 17, "crop", left + 30, top + 24, right - 68, bot + 10, left + 20, top + 24, right - 78, bot + 10).trim(15, 17) +\
      v38.animate(17, 20, "crop", left + 20, top + 24, right - 78, bot + 10, left + 30, top + 24, right - 68, bot + 10).trim(18, 45) +\
      v38.animate(46, 50, "crop", left + 30, top + 24, right - 68, bot + 10, left + 40, top + 24, right - 58, bot + 10).trim(46, 50) +\
      v38.animate(50, 58, "crop", left + 40, top + 24, right - 58, bot + 10, left + 30, top + 24, right - 68, bot + 10).trim(51, 0)

v39 = full.trim(4468, 4503)
v39 = v39.animate(5, 11, "crop", left + 26, top + 24, right - 72, bot + 10, left + 36, top + 24, right - 62, bot + 10).trim(0, 11) +\
      v39.animate(12, 18, "crop", left + 36, top + 24, right - 62, bot + 10, left + 26, top + 24, right - 72, bot + 10).trim(12, 0)

v40 = full.trim(4504, 4555)
v40 = v40.crop(left + 30, top + 24, right - 68, bot + 10)

v41 = full.trim(4556, 4598)
v41 = v41.animate(16, 23, "crop", left + 20, top + 14, right - 78, bot + 0, left + 30, top + 14, right - 68, bot + 0).trim(0, 23) +\
      v41.animate(23, 31, "crop", left + 30, top + 14, right - 68, bot + 0, left + 20, top + 14, right - 78, bot + 0).trim(24, 0)

v42 = full.trim(4599, 4660)
v42 = v42.crop(left + 30, top + 4, right - 68, bot - 10)

v43 = full.trim(4661, 4709)
v43 = v43.animate(3, 12, "crop", left + 20, top + 4, right - 78, bot - 10, left + 34, top + 4, right - 64, bot - 10).trim(0, 12) +\
      v43.animate(14, 19, "crop", left + 34, top + 4, right - 64, bot - 10, left + 20, top + 4, right - 78, bot - 10).trim(13, 0)

v44 = full.trim(4711, 4763)
v44 = v44.crop(left + 30, top + 14, right - 68, bot - 0)

v45 = full.trim(4765, 4878)
v45 = v45.crop(left + 30, top + 4, right - 68, bot - 10)

v46 = full.trim(4879, 4913)
v46 = v46.crop(left + 30, top + 4, right - 68, bot - 10)

v47 = full.trim(4914, 4940)
v47 = v47.crop(left + 30, top + 4, right - 68, bot - 10)

v48 = full.trim(4941, 4980)
v48 = v48.animate(0, 5, "crop", left + 30, top + 14, right - 68, bot - 0, left + 20, top + 14, right - 78, bot - 0)

v49 = full.trim(4981, 5027)
v49 = v49.crop(left + 20, top + 14, right - 78, bot - 0)

v50 = full.trim(5028, 5054)
v50 = v50.crop(left + 20, top + 14, right - 78, bot - 0)

v51 = full.trim(5055, 5111)
v51 = v51.crop(left + 24, top + 14, right - 74, bot - 0)

v52 = full.trim(5112, 5225)
v52 = v52.crop(left + 24, top + 4, right - 74, bot - 10)

v53 = full.trim(5226, 5269)
v53 = v53.animate(0, 18, "crop", left + 8, top + 4, right - 90, bot - 10, left + 28, top + 4, right - 70, bot - 10).trim(0, 18) +\
      v53.animate(28, 36, "crop", left + 28, top + 4, right - 70, bot - 10, left + 18, top + 4, right - 80, bot - 10).trim(19, 0)

v54 = full.trim(5270, 5335)
v54 = v54.animate(0, 1, "crop", left + 20, top + 4, right - 78, bot - 10, left + 30, top + 4, right - 68, bot - 10).trim(0, 1) +\
      v54.animate(2, 3, "crop", left + 30, top + 4, right - 68, bot - 10, left + 20, top + 4, right - 78, bot - 10).trim(2, 3) +\
      v54.animate(31, 44, "crop", left + 20, top + 4, right - 78, bot - 10, left + 10, top + 4, right - 88, bot - 10).trim(4, 44) +\
      v54.animate(45, 56, "crop", left + 10, top + 4, right - 88, bot - 10, left + 22, top + 4, right - 76, bot - 10).trim(45, 0)

v55 = full.trim(5336, 5401)
v55 = v55.crop(left + 18, top + 4, right - 80, bot - 10)

v56 = full.trim(5402, 5486)
v56 = v56.animate(12, 21, "crop", left + 10, top + 24, right - 88, bot + 10, left + 30, top + 24, right - 68, bot + 10).trim(0, 21) +\
      v56.animate(21, 44, "crop", left + 30, top + 24, right - 68, bot + 10, left + 20, top + 24, right - 78, bot + 10).trim(22, 72) +\
      v56.animate(73, 80, "crop", left + 20, top + 24, right - 78, bot + 10, left + 10, top + 24, right - 88, bot + 10).trim(73, 0)

v57 = full.trim(5487, 5541)
v57 = v57.animate(9, 18, "crop", left + 10, top + 4, right - 88, bot - 10, left + 30, top + 4, right - 68, bot - 10).trim(0, 18) +\
      v57.animate(18, 29, "crop", left + 30, top + 4, right - 68, bot - 10, left + 14, top + 4, right - 84, bot - 10).trim(19, 46) +\
      v57.animate(47, 49, "crop", left + 14, top + 4, right - 84, bot - 10, left + 20, top + 4, right - 78, bot - 10).trim(47, 0)

v58 = full.trim(5542, 5596)
v58 = v58.crop(left + 18, top + 14, right - 80, bot - 00)

v59 = full.trim(5597, 5654)
v59 = v59.animate(0, 12, "crop", left + 18, top + 4, right - 80, bot - 10, left + 32, top + 4, right - 66, bot - 10).trim(0, 12) +\
      v59.animate(12, 23, "crop", left + 32, top + 4, right - 66, bot - 10, left + 18, top + 4, right - 80, bot - 10).trim(13, 0)

v60 = full.trim(5655, 5719)
v60 = v60.crop(left + 18, top + 14, right - 80, bot - 00)

v61 = full.trim(5720, 5844)
v61 = v61.crop(left + 18, top + 4, right - 80, bot - 10)

v62 = full.trim(5845, 5920)
v62 = v62.crop(left + 24, top + 4, right - 90, bot - 10)

v63 = full.trim(5922, 6001)
v63 = v63.crop(left + 20, top + 4, right - 78, bot - 10)

v64 = full.trim(6002, 6066)
v64 = v64.crop(left + 20, top + 4, right - 88, bot - 10)

#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).info.prefetch
#return v64.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*
*/


#******

# 33

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").extractY.ConvertToYV12()
v33 = v33.autolevels(minRng=0, input_low=16, output_low=16, /*ignore_low=0.0003,*/ ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v33 = v33.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v33.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
return v33.histogram("levels")
return v33
#adjustframerate

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
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode ).crop(0,0,-dw,-dh)
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
