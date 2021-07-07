SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
SetFilterMTMode("fft3dfilter", 2)
SetFilterMTMode("LSMASHVideoSource", 3)
SetFilterMTMode("LWLibavVideoSource", 3)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("Reverse", 3)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

src1 = LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02 cast 1.720p.mov")
src2 = LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\11943 Bakhtin N8 02 cast 2.720p.mov")
last = src1 + src2
assumefps(18)

#crop(146,0,-190,-0)
crop(146,0,-224,-0)
#return last

# 196, 258, 326, 589, 685, 842, 955, 1065, 1285, 1357, 1494, 1554, 1675, 1796, 1917, 2107, 2183, 2242, 2284, 2354, 2376, 2424,
# 2489, 2515, 2576, 2850, 2982, 3046, 3231, 3276, 3435, 3620, 3815, 3996, 4049, 4062, 4103, 4150, 4180, 4257, 4475, 4604, 4766,
# 4906, 5007, 5104, 5292, 5359, 5516, 5556, 5773, 5891, 5995, 6152, 6218, 6283, 6464, 6831, 6840, 6940, 

src = last
#return last.ColorYUV(autogain=true)

/*
v1 = src.trim(196, 256).crop(0,0,-36,0)
v2 = src.trim(258, 325).crop(0,0,-36,0)
*/
v003 = src.trim(329, 587).autolevels(ignore_low=0.003, ignore_high=0.03, minRng=0, debug=false, autogamma=true, filterRadius = 0)#.crop(0,0,-36,0)
/*
v4 = src.trim(589, 683)#.crop(0,0,-36,0)
v5 = src.trim(686, 841).crop(0,0,-36,0)
v6 = src.trim(843, 954)#.crop(0,0,-36,0)
v7 = src.trim(955, 1064).crop(0,0,-36,0)
v8 = src.trim(1065, 1283).crop(0,0,-36,0)
v9 = src.trim(1290, 1355).crop(0,0,-18,0)
v10 = src.trim(1357, 1486)#.crop(0,0,-18,0)
# bad quality v11_0 = src.trim(1523, 1553).crop(0,0,-36,0)
v11 = src.trim(1563, 1674).crop(0,0,-44,0)
v12 = src.trim(1683, 1765).crop(0,0,-44,0)
v13 = (src.trim(1807, 1836) + src.trim(1838, 1916)).crop(0,0,-18,0)
v14 = src.trim(1917, 2106).crop(0,0,-18,0)
v15 = src.trim(2107, 2182).crop(0,0,-18,0)
v16 = src.trim(2183, 2241).crop(0,0,-18,0)
v17 = src.trim(2242, 2283).crop(0,0,-24,0)
v18 = (src.trim(2284, 2334)+src.trim(2336, 2353)).crop(0,0,-18,0)
v19 = src.trim(2354, 2375).crop(0,0,-18,0)
v20 = (src.trim(2377, 2409)+src.trim(2411, 2423)).crop(0,0,-36,0)
v21 = (src.trim(2425, 2458)+src.trim(2460, 2488)).crop(0,0,-24,0)
v22 = src.trim(2490, 2514).crop(0,0,-36,0)
v23 = src.trim(2515, 2574).crop(0,0,-24,0)
v24 = (src.trim(2577, 2607)+src.trim(2609, 2610)+src.trim(2612, 2666)+src.trim(2669, 2681)+\
       src.trim(2683, 2688)+src.trim(2690, 2691)+src.trim(2693, 2694)+src.trim(2697, 2703)+\
       src.trim(2705, 2818)+src.trim(2820, 2829)+src.trim(2831, 2836)+src.trim(2840, 2849)).crop(0,0,-36,0)
v25 = src.trim(2854, 2981).crop(0,0,-36,0)
v26 = src.trim(2983, 3045).crop(0,0,-36,0)
v27 = src.trim(3047, 3220).crop(0,0,-8,-88)
v28 = src.trim(3233, 3275).crop(0,0,-12,0)
*/

#return v003.histogram("levels")

v003 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\Digitalizace 11943\1980_01-28\v2-003.avi").ConvertToYV24()

v003 = v003.Filter(th_SAD=4000, th_SADC=4000, sigma_y=16, sigma_c=16)#.autogamma
#return v003.Prefetch(6)

v003 = v003.AdjustColor(ou=18, ov=-30, lo_th=0.2, hi_th=0, red=0.9, blu=0.9).tweak(sat=1.2, coring=false).autolevels(gamma=1.2)
v003 = v003.RemoveDirt.assumefps(16)#.AdjustFrameRate(preset_p = "slowest")

last = v003
#last = v001+v002+v003+v004+v005+v006+v007+v008+v009+v010+v011+v012+v013+v014+v015+v016+v017+\
#       v018+v019+v020+v021+v022+v023+v024+v025+v026+v027+v028+v029+v030+v031+v032+v033

v003_0 = LWLibavVideoSource("D:\Users\ilx\wrk\video\Super8\Digitalizace 11943\1980\01-04.avi").ConvertToYV24()

#stackhorizontal(v003_0.trim(188, 0))
#last = last.interleave(v003_0.trim(188, 0))

histogram("levels")
ConvertToYV12
Prefetch(6)

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", bool "gam_mac")
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
    gam_mac = Default(gam_mac, true)

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=1, Scale=2, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       ConvertToYV24() : c

#    c = c.AdjustDiv2(1, 2)

    return c
}

function Filter(clip c, int "th_SAD", int "th_SADC", float "sigma_y", float "sigma_c")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)

    c = c.SMDegrain(tr=9, thSAD=th_SAD, thSADC=th_SADC, RefineMotion=true, prefilter=2)
    c = c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6).\
          fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_c/8, sigma2=sigma_c/4, sigma3=sigma_c, sigma4=sigma_c, plane=3, wintype=0, bt = 5, ncpu=6)

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
    _grey=default(_grey, false)
	repmode=default(repmode, 16)
	clmode=17
	clensed=Clense(input, grey=_grey, cache=4)
	sbegin = ForwardClense(input, grey=_grey, cache=-1)
	send = BackwardClense(input, grey=_grey, cache=-1)
	alt=Repair(SCSelect(input, sbegin, send, clensed, debug=true), input, mode=repmode, modeU = _grey ? -1 : repmode ) 
	restore=Repair(clensed, input, mode=repmode, modeU = _grey ? -1 : repmode)
	corrected=RestoreMotionBlocks(clensed, restore, neighbour=input, alternative=alt, gmthreshold=70, dist=1, dmode=2, debug=false, noise=10, noisy=12, grey=_grey)
    return corrected
	return RemoveGrain(corrected, mode=clmode, modeU = _grey ? -1 : clmode )
}
