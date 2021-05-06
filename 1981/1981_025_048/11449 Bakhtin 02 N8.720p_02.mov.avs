SetFilterMTMode("DEFAULT_MT_MODE", 3)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

#LoadPlugin("D:\Program Files (x86)\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("d:\users\ilx\wrk\video\Super8\1981\11449 Bakhtin 02 cast1 N8.720p.mov")
assumefps(18)

#c1 = LSMASHVideoSource("d:\users\ilx\wrk\video\Super8\1981\11449 Bakhtin 01 cast1 S8.720p.mov")
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
# 14752, 15032, 15368, 15599, 15675, 15714, 15807, 15900, 15930, 16015, 16113, 16155, 16274, 16330, 16349, 16442, 16463, 16651, 16899, 17071,
# 17145, 17198, 17266, 17407, 17499, 17581, 17699, 17764, 17830, 17947, 18086, 18093, 18317, 18558, 18689, 19040, 19375, 19516, 19680, 19844,
# 19862, 19907, 19917, 19942, 19974, 20078, 20174, 20239, 20279, 20344, 20424, 20560, 20710, 20848, 20960, 21019, 21119, 21206, 21294, 21437,
# 21559, 21756, 21938, 22019, 22175, 22227, 22242, 22292, 22329, 22376, 22561, 22637, 22733, 22797, 22877, 22968, 23112, 23223, 23686, 23784,
# 23873, 23937, 24000, 24127, 24244, 24386, 24581, 24769, 24933, 25267, 25401, 25533, 25581, 25894, 26048, 26200, 26308, 26501, 26556, 26687,
# 26964, 27081, 27297, 27390, 27534, 27571, 27656, 27729, 27917, 27964, 28559, 28616, 28679, 28904, 28953, 29025, 29086, 29162, 29241, 29245,
# 29307, 29457, 29624, 29638, 29769,

global src = last
#return last

#v24 = src.trim(6182, 6204) #6292)
v25 = src.trim(6348, 6491)
v26 = src.trim(6494, 6540)
v27 = src.trim(6555, 6709)
v28 = src.trim(6712, 6938)
v29 = src.trim(6944, 6977)
v30 = src.trim(6979, 7074)
v31 = src.trim(7075, 7294)
v32 = src.trim(7296, 7486)
v33 = src.trim(7491, 7615)
v34 = src.trim(7619, 7746)
v35 = src.trim(7748, 7784)
v36 = src.trim(7785, 7812)
v37 = src.trim(7814, 7930)
v38 = src.trim(7932, 7987)
v39 = src.trim(7989, 8113)
v40 = src.trim(8117, 8199)
v41 = src.trim(8201, 8206)
v42 = src.trim(8208, 8350)
v43 = src.trim(8353, 8495)
v44 = src.trim(8497, 8631)
v45 = src.trim(8633, 8802)
v46 = src.trim(8804, 8980)
v47 = src.trim(8991, 8994) + src.trim(9002, 9175)
v47 = v47.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v48 = src.trim(9178, 9380).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30

global filter16 = true

/*

#******

# 47

v47 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_025_048\v47.avi").ConvertToYV24()
v47 = v47.AdjustColor(ou=2, ov=-2, sat=2.5, blu=1, gam_mac=true)
v47 = v47.removeDirt
v47 = v47.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v47 = v47.autolevels(ignore_low=0.003, ignore_high=0.003, gamma=0.9)
v47 = v47.ColorYUV(off_u=-6, off_v=-6, gain_y=0)
#return v47.histogram("levels").prefetch(6)
v47 = v47.adjustBorders
return v47.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v48 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_025_048\v48.avi").ConvertToYV24()
v48 = v48.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v48.prefetch(6)

v48 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_025_048\v48.avi").ConvertToYV24()
v48 = v48.AdjustColor(ou=0, ov=-2, sat=2, blu = 1, gam_mac=true)
v48 = v48.removeDirt
v48 = v48.ConvertToYV12.UnsharpMask(strength=300, radius=3, threshold=1)
v48 = v48.autolevels(ignore_low=0.003, ignore_high=0.003, gamma=0.8)
v48 = v48.ColorYUV(off_u=-1, off_v=-6, gain_y=0)
#return v48.histogram("levels").prefetch(6)
v48 = v48.adjustBorders
return v48.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

#******

*/

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
v1 = v1.AdjustColor(2, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v2 = v2.AdjustColor(6, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v3 = v3.AdjustColor(6, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v4 = v4.AdjustColor(6, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustColor(6, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v6 = v6.AdjustColor(6, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v7 = v7.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v10 = v10.AdjustColor(4, -8, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v12 = v12.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v13 = v13.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v15 = v15.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v16 = v16.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = v22.AdjustColor(8, -12, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
47 v23 = v23.AdjustColor(2, -2, 0, 1.5, blu_mul = 0.90).assumefps(18).AdjustFrameRate(preset_p = "slowest")
48 v24 = v24.AdjustColor(0, -2, 0, 1.5, blu_mul = 0.90).assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
Prefetch(6)
return last
*/