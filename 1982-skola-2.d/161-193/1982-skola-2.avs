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
# 7217, 7268, 7303, 7338, 7409, 7476, 7541, 7596, 7640, 7683, 7696, 7725, 7838, 8050, 8109, 8144, 8187, 8227, 8268, 8322, # 100
# 8347, 8441, 8515, 8595, 8686, 8875, 8960, 9012, 9042, 9123, 9148, 9185, 9256, 9327, 9378, 9403, 9458, 9496, 9538, 9608, # 120
# 9650, 9735, 9797, 9911, 9952, 10052, 10119, 10181, 10212, 10235, 10261, 10283, 10319, 10408, 10442, 10463, 10524, 10560, 10589, 10610, #140
# 10638, 10668, 10699, 10723, 10756, 10816, 10862, 10894, 10902, 10952, 11044, 11081, 11145, 11182, 11206, 11262, 11313, 11389, 11701, 11984, #160
# 12113, 12385, 12538, 12688, 12769, 13006, 13273, 13323, 13354, 13409, 13437, 13465, 13612, 13702, 13721, 13895, 13985, 14225, 14272, 14357,
# 14398, 14441, 14558, 14649, 14758, 14955, 15126, 15319, 15396, 15449, 15525, 15694, 15736, 15810, 15921,

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

#v160 = full.trim(12113, 12384)
#v160 = v160.crop(left + 20, top - 0, right - 78, bot - 14)

v161 = full.trim(12386, 12537)
v161 = v161.crop(left + 20, top + 10, right - 78, bot - 4)

v162 = full.trim(12538, 12687)
v162 = v162.crop(left + 20, top + 10, right - 88, bot - 4)

v163 = full.trim(12689, 12768)
v163 = v163.crop(left + 20, top + 10, right - 78, bot - 4)

v164 = full.trim(12769, 13005)
v164 = v164.crop(left + 20, top + 10, right - 78, bot - 4)

v165 = full.trim(13006, 13272)
v165 = v165.crop(left + 20, top + 10, right - 78, bot - 4)

v166 = full.trim(13274, 13322)
v166 = v166.crop(left + 20, top + 10, right - 78, bot - 4)

v167 = full.trim(13324, 13353)
v167 = v167.crop(left + 20, top + 10, right - 78, bot - 4)

v168 = full.trim(13354, 13408)
v168 = v168.crop(left + 20, top + 10, right - 78, bot - 4)

v169 = full.trim(13409, 13436)
v169 = v169.crop(left + 20, top + 10, right - 78, bot - 4)

v170 = full.trim(13437, 13464)
v170 = v170.crop(left + 30, top + 10, right - 68, bot - 4)

v171 = full.trim(13465, 13611)
v171 = v171.trim(0, 57).crop(left + 30, top + 10, right - 68, bot - 4) +\
       v171.trim(58, 58).crop(left + 30, top - 56, right - 68, bot - 70) +\
       v171.trim(59, 59).crop(left + 30, top - 30, right - 68, bot - 44) +\
       v171.trim(60, 60).crop(left + 30, top - 40, right - 68, bot - 54) +\
       v171.trim(61, 61).crop(left + 30, top - 30, right - 68, bot - 44) +\
       v171.trim(62, 62).crop(left + 30, top - 70, right - 68, bot - 84) +\
       v171.trim(63, 63).crop(left + 30, top - 30, right - 68, bot - 44) +\
       v171.trim(64, 64).crop(left + 30, top - 70, right - 68, bot - 84) +\
       v171.trim(65, 65).crop(left + 30, top - 20, right - 68, bot - 34) +\
       v171.trim(66, 66).crop(left + 30, top - 50, right - 68, bot - 64) +\
       v171.trim(67, 67).crop(left + 30, top + 10, right - 68, bot - 4) +\
       v171.trim(68, 68).crop(left + 30, top - 40, right - 68, bot - 54) +\
       v171.trim(69, 69).crop(left + 30, top + 10, right - 68, bot - 4) +\
       v171.trim(70, 70).crop(left + 30, top - 40, right - 68, bot - 54) +\
       v171.trim(71, 71).crop(left + 30, top + 10, right - 68, bot - 4) +\
       v171.trim(72, 72).crop(left + 30, top - 40, right - 68, bot - 54) +\
       v171.trim(73, 73).crop(left + 30, top + 0, right - 68, bot - 14) +\
       v171.trim(74, 77).crop(left + 30, top - 50, right - 68, bot - 64) +\
       v171.trim(78, 79).crop(left + 30, top - 20, right - 68, bot - 34) +\
       v171.trim(80, 80).crop(left + 30, top - 10, right - 68, bot - 24) +\
       v171.trim(81, 81).crop(left + 30, top - 60, right - 68, bot - 74) +\
       v171.trim(82, 82).crop(left + 30, top - 60, right - 68, bot - 74) +\
       v171.trim(83, 0).crop(left + 30, top - 20, right - 68, bot - 34)

v172 = full.trim(13612, 13701)
v172 = v172.crop(left + 20, top + 10, right - 78, bot - 4)

v173 = full.trim(13703, 13720)
v173 = v173.animate(8, 17, "crop", left + 20, 0, right - 78, 0, left + 70, 0, right - 28, 0). \
            animate(13, 14, "crop", 0, top + 10, 0, bot - 4, 0, top - 110, 0, bot - 124)

v174 = full.trim(13722, 13894)
v174 = v174.animate(0, 6, "crop", left - 20, top + 20, right - 118, bot + 6, left - 10, top + 20, right - 108, bot + 6).trim(0, 6) +\
       v174.animate(6, 7, "crop", left + 0, top + 20, right - 98, bot + 6, left + 10, top + 20, right - 88, bot + 6).trim(7, 0)

v175 = full.trim(13895, 13984)
v175 = v175.crop(left + 14, top + 20, right - 84, bot + 6)

v176 = full.trim(13985, 14224)
v176 = v176.crop(left + 14, top + 30, right - 84, bot + 16)

v177 = full.trim(14225, 14271)
v177 = v177.crop(left + 14, top + 30, right - 84, bot + 16)

v178 = full.trim(14272, 14356)
v178 = v178.crop(left + 14, top + 30, right - 84, bot + 16)

v179 = full.trim(14357, 14397)
v179 = v179.crop(left + 14, top + 30, right - 84, bot + 16)

v180 = full.trim(14398, 14440)
v180 = v180.crop(left + 14, top + 30, right - 84, bot + 16)

v181 = full.trim(14441, 14557)
v181 = v181.crop(left + 14, top + 30, right - 84, bot + 16)

v182 = full.trim(14558, 14648)
v182 = v182.crop(left + 14, top + 30, right - 84, bot + 16)

v183 = full.trim(14649, 14757)
v183 = v183.crop(left + 4, top + 20, right - 94, bot + 6)

v184 = full.trim(14758, 14954)
v184 = v184.crop(left + 4, top + 20, right - 94, bot + 6)

v185 = full.trim(14955, 15125)
v185 = v185.crop(left + 4, top + 20, right - 94, bot + 6)

v186 = full.trim(15126, 15318)
v186 = v186.crop(left + 4, top + 20, right - 94, bot + 6)

v187 = full.trim(15320, 15395)
v187 = v187.crop(left + 4, top + 20, right - 94, bot + 6)

v188 = full.trim(15397, 15448)
v188 = v188.crop(left + 4, top + 20, right - 94, bot + 6)

v189 = full.trim(15449, 15510)
v189 = v189.crop(left + 4, top + 20, right - 94, bot + 6)

v190 = full.trim(15526, 15693)
v190 = v190.crop(left + 4, top + 20, right - 94, bot + 6)

v191 = full.trim(15694, 15735)
v191 = v191.crop(left + 4, top + 20, right - 94, bot + 6)

v192 = full.trim(15736, 15809)
v192 = v192.crop(left - 10, top + 20, right - 108, bot + 6)

v193 = full.trim(15810, 15919)
v193 = v193.animate(56, 57, "crop", left - 20, top + 20, right - 118, bot + 6, left - 20, top + 40, right - 118, bot + 26).trim(0, 57) +\
       v193.animate(106, 107, "crop", left - 20, top + 40, right - 118, bot + 26, left - 20, top - 110, right - 118, bot - 124).trim(58, 0)

#return v125.spline64Resize(v125.width*3/4, v125.height*3/4).interleave(v125.gaussResize(v125.width*3/4, v125.height*3/4)).\
#       autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).info.prefetch
#return v193.adjustSize.adjustBorders.autolevels(filterRadius=0, minRng=0, border_l=100, border_r=100).prefetch
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
