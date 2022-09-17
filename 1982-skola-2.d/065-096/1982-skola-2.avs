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
# 5720, 5845, 5921, 6002, 6067, 6115, 6162, 6229, 6435, 6521, 6598, 6618, 6623, 6704, 6773, 6948, 7028, 7034, 7045, 7105,
# 7217, 7268, 7303, 7338, 7409, 7476, 7541, 7596, 7640, 7683, 7696, 7725, 7838, 8050, 8109, 8144, 8187, 8227, 8268, 8322,
# 8347,

# skip (631, 634)
# skip (7683, 7695)

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

#v64 = full.trim(6002, 6066)
#v64 = v64.crop(left + 18, top + 4, right - 80, bot - 10)

v65 = full.trim(6067, 6114)
v65 = v65.animate(11, 15, "crop", left + 8, top + 4, right - 90, bot - 10, left + 18, top + 4, right - 80, bot - 10).trim(0, 15) +\
      v65.animate(15, 18, "crop", left + 18, top + 4, right - 80, bot - 10, left + 12, top + 4, right - 86, bot - 10).trim(16, 0)

v66 = full.trim(6115, 6161)
v66 = v66.animate(1, 6, "crop", left + 0, top + 4, right - 98, bot - 10, left + 10, top + 4, right - 88, bot - 10).trim(0, 6) +\
      v66.animate(8, 12, "crop", left + 10, top + 4, right - 88, bot - 10, left + 0, top + 4, right - 98, bot - 10).trim(7, 12) +\
      v66.animate(13, 18, "crop", left + 0, top + 4, right - 98, bot - 10, left + 16, top + 4, right - 82, bot - 10).trim(13, 18) +\
      v66.animate(18, 24, "crop", left + 16, top + 4, right - 82, bot - 10, left + 14, top + 4, right - 84, bot - 10).trim(19, 24) +\
      v66.animate(24, 28, "crop", left + 14, top + 4, right - 84, bot - 10, left + 22, top + 4, right - 76, bot - 10).trim(25, 28) +\
      v66.animate(28, 32, "crop", left + 22, top + 4, right - 76, bot - 10, left + 10, top + 4, right - 88, bot - 10).trim(29, 32) +\
      v66.animate(32, 37, "crop", left + 10, top + 4, right - 88, bot - 10, left + 16, top + 4, right - 82, bot - 10).trim(33, 38) +\
      v66.animate(39, 46, "crop", left + 16, top + 4, right - 82, bot - 10, left + 6, top + 4, right - 92, bot - 10).trim(39, 0)
v66 = v66.crop(2, 0, -8, 0)

v67 = full.trim(6162, 6228)
v67 = v67.crop(left + 18, top + 4, right - 90, bot - 10)

v68 = full.trim(6229, 6434)
v68 = v68.crop(left + 22, top + 4, right - 76, bot - 10)

v69 = full.trim(6435, 6520)
v69 = v69.crop(left + 14, top + 16, right - 84, bot + 2)

v70 = full.trim(6521, 6597)
v70 = v70.trim(0, 41) + v70.trim(44, 0)
v70 = v70.animate(0, 5, "crop", left + 18, top + 26, right - 80, bot + 12, left + 4, top + 26, right - 94, bot + 12).trim(0, 5) +\
      v70.animate(5, 7, "crop", left + 4, top + 26, right - 94, bot + 12, left + 10, top + 26, right - 88, bot + 12).trim(6, 7) +\
      v70.animate(7, 10, "crop", left + 18, top + 26, right - 80, bot + 12, left + 24, top + 26, right - 74, bot + 12).trim(8, 10) +\
      v70.animate(10, 16, "crop", left + 16, top + 26, right - 82, bot + 12, left + 18, top + 26, right - 80, bot + 12).trim(11, 16) +\
      v70.animate(16, 21, "crop", left + 18, top + 26, right - 80, bot + 12, left + 24, top + 26, right - 74, bot + 12).trim(17, 21) +\
      v70.animate(21, 27, "crop", left + 24, top + 26, right - 74, bot + 12, left + 10, top + 26, right - 88, bot + 12).trim(22, 0)
v70 = v70.crop(2, 0, -8, 0)

v71 = full.trim(6598, 6617)
v71 = v71.animate(0, 7, "crop", left + 14, top + 16, right - 84, bot + 2, left + 28, top + 16, right - 70, bot + 2).trim(0, 7) +\
      v71.animate(8, 9, "crop", left + 8, top + 16, right - 90, bot + 2, left - 20, top + 16, right - 118, bot + 2).trim(8, 0)

v72 = full.trim(6619, 6622)
v72 = v72.crop(left + 24, top + 16, right - 74, bot + 2)

v73 = full.trim(6623, 6703)
v73 = v73.animate(4, 7, "crop", left + 24, top + 8, right - 74, bot - 6, left + 0, top + 8, right - 98, bot - 6).trim(0, 7) +\
      v73.animate(7, 10, "crop", left + 0, top + 8, right - 98, bot - 6, left + 20, top + 8, right - 78, bot - 6).trim(8, 0)

v74 = full.trim(6705, 6772)
v74 = v74.animate(5, 9, "crop", left - 20, top + 16, right - 118, bot + 2, left + 24, top + 16, right - 74, bot + 2).trim(0, 9) +\
      v74.animate(9, 14, "crop", left + 24, top + 16, right - 74, bot + 2, left - 20, top + 16, right - 118, bot + 2).trim(10, 14) +\
      v74.animate(15, 23, "crop", left - 20, top + 16, right - 118, bot + 2, left + 24, top + 16, right - 74, bot + 2).trim(15, 0)

v75 = full.trim(6773, 6947)
v75 = v75.crop(left + 24, top + 0, right - 74, bot - 14)

v76 = full.trim(6948, 7027)
v76 = v76.crop(left + 14, top + 0, right - 84, bot - 14)

v77 = full.trim(7028, 7033)
v77 = v77.crop(left + 14, top + 0, right - 84, bot - 14)

v78 = full.trim(7034, 7044)
v78 = v78.crop(left + 14, top + 0, right - 84, bot - 14)

v79 = full.trim(7045, 7104)
v79 = v79.crop(left + 14, top + 0, right - 84, bot - 14)

v80 = full.trim(7105, 7216)
v80 = v80.crop(left + 14, top + 0, right - 84, bot - 14)

v81 = full.trim(7217, 7267)
v81 = v81.crop(left + 14, top + 0, right - 84, bot - 14)

v82 = full.trim(7268, 7302)
v82 = v82.crop(left + 14, top + 0, right - 84, bot - 14)

v83 = full.trim(7303, 7337)
v83 = v83.crop(left + 14, top + 0, right - 84, bot - 14)

v84 = full.trim(7338, 7408)
v84 = v84.crop(left + 14, top + 0, right - 84, bot - 14)

v85 = full.trim(7409, 7475)
v85 = v85.crop(left + 4, top + 0, right - 94, bot - 14)

v86 = full.trim(7476, 7540)
v86 = v86.crop(left - 0, top + 0, right - 98, bot - 14)

v87 = full.trim(7541, 7595)
v87 = v87.crop(left - 0, top + 0, right - 98, bot - 14)
v87 = v87.trim(0, 46)

v88 = full.trim(7596, 7639)
v88 = v88.crop(left - 0, top + 0, right - 98, bot - 14)

v89 = full.trim(7640, 7682)
v89 = v89.crop(left - 0, top + 0, right - 98, bot - 14)

#v90 = full.trim(7683, 7695)
v90 = full.trim(7696, 7724)
v90 = v90.crop(left - 0, top + 0, right - 98, bot - 14)

v91 = full.trim(7725, 7837)
v91 = v91.trim(0, 57) + v91.trim(69, 0)
v91 = v91.crop(left - 0, top + 0, right - 98, bot - 14)

v92 = full.trim(7838, 8049)
v92 = v92.crop(left - 0, top + 0, right - 98, bot - 14)

v93 = full.trim(8050, 8108)
v93 = v93.crop(left - 0, top + 0, right - 98, bot - 14)

v94 = full.trim(8109, 8143)
v94 = v94.crop(left - 0, top - 40, right - 98, bot - 54)

v95 = full.trim(8144, 8186)
v95 = v95.crop(left - 0, top - 40, right - 98, bot - 54)

v96 = full.trim(8187, 8226)
v96 = v96.crop(left - 0, top + 0, right - 98, bot - 14)

#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).info.prefetch
#return v96.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
#return src.adjustBorders.info.prefetch

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

import("common.avs")

/*

#******

# 65

v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").extractY.ConvertToYV12()
v33 = v33.autolevels(minRng=0, input_low=16, output_low=16, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60)
#v33 = v33.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1).trim(0, -1) +\
      v33.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, border_l=80, border_t=60, border_r=80, border_b=60, gamma=1.3).trim(1, 0)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
return v33.histogram("levels")
return v33
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
