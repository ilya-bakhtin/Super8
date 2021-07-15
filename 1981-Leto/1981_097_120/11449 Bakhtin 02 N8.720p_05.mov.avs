SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

#LoadPlugin("D:\Program Files (x86)\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1981\11449 Bakhtin 02 cast1 N8.720p.mov")
assumefps(18)

#c1 = LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1981\11449 Bakhtin 01 cast1 S8.720p.mov")
#c1 = c1.assumefps(18)
#c1 = c1.crop(140,4,-140,-4)
#b = BlankClip(c1, length=3000, color=$000000)

#FlipVertical.Reverse()

crop(146,0,-190,-0)
#return last

# 428, 431, 676, 823, 889, 944, 999, 1060, 1121, 1145, 1286, 1563, 1696, 1946, 2051, 2124, 2211, 2386, 2417, 2454, 2493, 2676, 2751, 3017, 3223,
# 3416, 3598, 3749, 3875, 3899, 4085, 4245, 4437, 4461, 4496, 4701, 4940, 5042, 5065, 5116, 5182, 5468, 5525, 5740, 5754, 5946, 6070, 6179, 6292,
# 6493, 6711, 6942, 6979, 7075, 7295, 7489, 7619, 7747, 7785, 7813, 7931, 7988, 8116, 8200, 8207, 8352, 8496, 8632, 8803, 8991, 9177, 9381, 9578,
# 9633, 9715, 9806, 9892, 10060, 10188, 10367, 10512, 10672, 10820, 10902, 11032, 11120, 11295, 11470, 11551, 11653, 11701, 11842, 11936, 12119, 12176,
# 12228, 12414, 12611, 12691, 12826, 13046, 13130, 13302, 13464, 13548, 13638, 13887, 14003, 14112, 14115, 14122, 14194, 14256, 14455, 14719,
# 14752, 15032, 15368, 15599, 15675, 15714, 15807, 15900, 15930, 16015, 16113, 16155, 16241, 16274, 16330, 16349, 16423, 16463, 16651, 16899, 17071,
# 17145, 17198, 17266, 17407, 17499, 17581, 17699, 17764, 17830, 17947, 18086, 18093, 18317, 18558, 18689, 19040, 19375, 19516, 19680, 19844,
# 19862, 19907, 19917, 19942, 19974, 20078, 20174, 20239, 20279, 20344, 20424, 20560, 20710, 20848, 20960, 21019, 21119, 21206, 21294, 21437,
# 21559, 21756, 21938, 22019, 22175, 22227, 22242, 22292, 22329, 22376, 22561, 22637, 22733, 22797, 22877, 22968, 23112, 23223, 23686, 23784,
# 23873, 23937, 24000, 24127, 24244, 24386, 24581, 24769, 24933, 25267, 25401, 25533, 25581, 25894, 26048, 26200, 26308, 26501, 26556, 26687,
# 26964, 27081, 27297, 27390, 27534, 27571, 27656, 27729, 27917, 27964, 28559, 28616, 28679, 28904, 28953, 29025, 29086, 29162, 29241, 29245,
# 29307, 29457, 29624, 29638, 29769,

global src = last
#return last

#v24 = src.trim(15715, 15806)
v97 = src.trim(15808, 15898).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v98 = src.trim(15901, 15929).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v99 = src.trim(15931, 16014).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v100 = src.trim(16017, 16112).autolevels(ignore_low=0.0003, ignore_high=0.003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v5 = src.trim(16114, 16154)
v6 = src.trim(16156, 16240)
v7 = src.trim(16242, 16273)
v8 = src.trim(16275, 16329)
v9 = src.trim(16331, 16348)
v10 = src.trim(16350, 16422)
v11 = src.trim(16424, 16462)
v12 = src.trim(16465, 16650)
v13 = src.trim(16652, 16898)
v14 = src.trim(16900, 17070)
v15 = src.trim(17072, 17144)
v16 = src.trim(17146, 17197)
v17 = src.trim(17199, 17265)
v18 = src.trim(17267, 17405)
v19 = src.trim(17409, 17497)
v20 = src.trim(17499, 17580)
v21 = src.trim(17582, 17697)
v22 = src.trim(17700, 17762)
v23 = src.trim(17765, 17829)
v24 = src.trim(17831, 17945)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30

global filter16 = true

/*

#******

# 97

v97 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v97.avi")
v97 = v97.convertToYV12
v97 = v97.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                 truemotion=false, sigma_y=0, sigma_c=0)
#v97 = v97.AdjustColor(ou=8, ov=-6, sat=1.9, blu=0.94, gam_mac=true)
#return v97.histogram("levels").prefetch(6)
return v97.prefetch(6)

v97 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v97-.avi").ConvertToYV24()
v97 = v97.AdjustColor(ou=8, ov=-6, sat=1.9, blu=1, gam_mac=true)
v97 = v97.convertToYV12
v97 = v97.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v97 = v97.removeDirt
v97 = v97.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#v97 = v97.autolevels(gamma=1.1, ignore_low=0.001, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#return v97.histogram("levels").prefetch(6)
v97 = v97.adjustBorders
return v97.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v98 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v98.avi")
v98 = v98.convertToYV12
v98 = v98.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                 truemotion=false, sigma_y=0, sigma_c=0)
#v98 = v98.AdjustColor(ou=8, ov=-6, sat=1.9, blu=0.94, gam_mac=true)
#return v98.histogram("levels").prefetch(6)
return v98.prefetch(6)

v98 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v98-.avi").ConvertToYV24()
v98 = v98.AdjustColor(ou=8, ov=-8, lock_chan=1, sat=1.9, blu=1, gam_mac=true)
v98 = v98.convertToYV12
v98 = v98.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v98 = v98.removeDirt
v98 = v98.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#v98 = v98.autolevels(gamma=1.1, ignore_low=0.001, ignore_high=0.0003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#v98 = v98.colorYUV(off_u = -2)
#return v98.histogram("levels").prefetch(6)
v98 = v98.adjustBorders
return v98.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v99 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v99.avi")
v99 = v99.convertToYV12
v99 = v99.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                 truemotion=false, sigma_y=0, sigma_c=0)
#v99 = v99.AdjustColor(ou=8, ov=-6, sat=1.9, blu=0.94, gam_mac=true)
#return v99.histogram("levels").prefetch(6)
return v99.prefetch(6)

v99 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v99-.avi").ConvertToYV24()
v99 = v99.AdjustColor(ou=8, ov=-8, lock_chan=1, sat=1.9, blu=1, gam_mac=true)
v99 = v99.convertToYV12
v99 = v99.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v99 = v99.removeDirt
v99 = v99.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#v99 = v99.autolevels(gamma=1.1, ignore_low=0.001, ignore_high=0.001, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#v99 = v99.colorYUV(off_u = -2)
#return v99.histogram("levels").prefetch(6)
v99 = v99.adjustBorders
return v99.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v100 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v100.avi")
v100 = v100.convertToYV12
v100 = v100.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=8, overlap=4,\
                   truemotion=false, sigma_y=0, sigma_c=3)
#v100 = v100.AdjustColor(ou=8, ov=-6, sat=1.9, blu=0.94, gam_mac=true)
#return v100.histogram("levels").prefetch(6)
return v100.prefetch(6)

v100 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_097_120\v100-.avi").ConvertToYV24()
v100 = v100.AdjustColor(ou=6, ov=-8, lock_chan=1, lo_th=0.2, hi_th=0.2, sat=2.2, blu=0.88, gam_mac=true)
v100 = v100.convertToYV12
v100 = v100.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v100 = v100.removeDirt
v100 = v100.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v100 = v100.autolevels(gamma=1.1, ignore_low=0.003, ignore_high=0.003, border_l = 0, border_r = 0, filterRadius = 0, minRng=0, autolevel=true)
#v100 = v100.colorYUV(off_u = -2)
#return v100.histogram("levels").prefetch(6)
v100 = v100.adjustBorders
return v100.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

*/

#******


function adjustBorders(clip c)
{
    return src.height == c.height && src.width == c.width ? c : c.addBorders(0, 0, src.width - c.width, src.height - c.height)
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
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion")
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

    c = filter16 ? c.convertBits(16) : c
#c = c.SMDegrain(tr=tr, globals=3, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap)
    c = th_SAD == 0 && th_SADC == 0 ? c : c.SMDegrain(tr=tr, thSAD=th_SAD, thSADC=th_SADC, dct=dct, blksize=blksize, overlap=overlap, search=3, truemotion=truemotion,\
                                                      RefineMotion=RefineMotion, /*prefilter=2,*/ contrasharp=contrasharp, globals=0, pel=1, subpixel=1,\
                                                      hpad=hpad, vpad=vpad)
    c = sigma_y == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6)
    c = sigma_c == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

    c = filter16 ? c.convertBits(8) : c

    return c
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
dh = src.height - input.height
dw = src.width - input.width
input = input.adjustBorders
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
/*
#97 v1 = v1.AdjustColor(6, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#98 v2 = v2.AdjustColor(6, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#99 v3 = v3.AdjustColor(6, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#100 v4 = v4.AdjustColor(6, -6, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustColor(6, -6, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v6 = v6.AdjustColor(6, -6, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v7 = v7.AdjustColor(6, -6, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustColor(6, -6, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustColor(6, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v10 = v10.AdjustColor(6, -2, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustColor(4, -2, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v12 = v12.AdjustColor(4, -2, 0, 1.5, blu_mul = 0.88).assumefps(24)#.AdjustFrameRate(preset_p = "slowest")
v13 = v13.AdjustColor(4, -2, 0, 1.5, blu_mul = 0.88).assumefps(24)#.AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v15 = v15.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v16 = v16.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustColor(12, -4, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustColor(10, -4, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustColor(12, -8, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(12, -8, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(10, -8, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = v22.AdjustColor(14, -10, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = v23.AdjustColor(14, -10, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v24 = v24.AdjustColor(10, -8, 0, 1.5, blu_mul = 0.88).assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v12+v13
ConvertToYV12
Prefetch(6)
*/