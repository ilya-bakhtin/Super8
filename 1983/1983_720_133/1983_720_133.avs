LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
assumefps(18)

trim(1, 21373)

crop(240, 0, -240, 0)

#Spline64resize(960, 720)
src = last

#trim(19047, 0)
#return last.prefetch(6)

# 59, 214, 251, 291, 389, 484, 571, 623, 668, 777, 985, 1139, 1189, 1236, 1459, 1538, 1781, 2018, 2075, 2311, 2361, 2476,
# 2751, 2803, 2882, 3086, 3191, 3227, 3362, 3447, 3702, 3736, 3920, 4143, 4195, 4381, 4623, 4701, 4738, 5017, 5075, 5284,
# 5378, 5586, 5722, 5846, 6151, 6320, 6501, 6582, 6703, 6797, 6806, 6910, 6992, 7165, 7378, 7556, 7673, 7818, 8043, 8186,
# 8364, 8482, 8646, 8841, 9019, 9217, 9419, 9663, 9988, 10219, 10408, 10606, 10614, 10814, 10886, 11185, 11354, 11423,
# 11674, 11750, 11843, 11965, 12197, 12282, 12511, 12691, 12751, 12894, 13008, 13157, 13349, 13528, 13622, 13683, 13801, 14126,
# 14360, 14448, 14511, 14626, 14789, 14959, 15100, 15381, 15523, 15641, 15925, 16109, 16294, 16598, 16765, 16777, 16795,
# 16920, 17110, 17214, 17307, 17393, 17483, 17616, 17689, 17829, 17939, 18162, 18169, 18450, 18471, 18698, 18769, 18850,
# 18938, 18985, 18995, 19101, 19375, 19510, 19608, 19715, 19904, 19921, 20008, 20128, 20161, 20230, 20311, 20493, 20597,
# 20685, 20760, 20810, 20923, 20932, 21001, 21230, 21325, 21373

#v132 = src.trim(19510, 19607).autolevels(ignore=0.0003, filterRadius = 0)
v133 = src.trim(19608, 19714).autolevels(ignore=0.0003, filterRadius = 0)
v134 = src.trim(19716, 19902).autolevels(ignore=0.0003, filterRadius = 0)
v135 = src.trim(19904, 19920).autolevels(ignore=0.0003, filterRadius = 0)
v136 = src.trim(19921, 20007).autolevels(ignore=0.0003, filterRadius = 0)
v137 = src.trim(20008, 20127).autolevels(ignore=0.0003, filterRadius = 0)
v138 = src.trim(20128, 20160).autolevels(ignore=0.0003, filterRadius = 0)
v139 = src.trim(20161, 20229).autolevels(ignore=0.0003, filterRadius = 0)
v140 = src.trim(20230, 20310).autolevels(ignore=0.0003, filterRadius = 0)
v141 = src.trim(20311, 20492).autolevels(ignore=0.0003, filterRadius = 0)
v142 = src.trim(20494, 20596).autolevels(ignore=0.0003, filterRadius = 0)
v143 = src.trim(20597, 20684).autolevels(ignore=0.0003, filterRadius = 0)
v144 = src.trim(20685, 20759).autolevels(ignore=0.0003, filterRadius = 0)
v145 = src.trim(20761, 20809).autolevels(ignore=0.0003, filterRadius = 0)
v146 = src.trim(20810, 20922).autolevels(ignore=0.0003, filterRadius = 0)
#v147 = src.trim(20923, 20931).autolevels(ignore=0.0003, filterRadius = 0)
v147 = src.trim(20932, 21000).autolevels(ignore=0.0003, filterRadius = 0)
v148 = src.trim(21001, 21229).autolevels(ignore=0.0003, filterRadius = 0)
v149 = src.trim(21230, 21324).autolevels(ignore=0.0003, filterRadius = 0)
#v150 = src.trim(21325, 21372).autolevels(ignore=0.0003, filterRadius = 0)
#return v150.histogram("levels")

#v132 = v132.Filter(th_SAD = 1200, th_SADC=1200)

/*
v133 = v133.Filter(th_SAD = 1100, th_SADC=1100)
v133_m = v133.PrepareMask
v133 = v133.ConvertToRGB.ExInpaint(mask = v133_m, dilate=3)
return v133.Prefetch(6)

v134 = v134.Filter(th_SAD = 1100, th_SADC=1100)
v134_m = v134.PrepareMask
v134 = v134.ConvertToRGB.ExInpaint(mask = v134_m)
return v134.prefetch(6)

v135 = v135.Filter(th_SAD = 1100, th_SADC=1100)
v135_m = v135.PrepareMask
v135 = v135.ConvertToRGB.ExInpaint(mask = v135_m, dilate=3)
return v135.prefetch(6)

v136 = v136.Filter(th_SAD = 1200, th_SADC=1200)
v137 = v137.Filter
v138 = v138.Filter(th_SAD = 1200, th_SADC=1200)
v139 = v139.Filter(th_SAD = 1200, th_SADC=1200)
v140 = v140.Filter
v141 = v141.Filter
v142 = v142.Filter
v143 = v143.Filter
v144 = v144.Filter(th_SAD = 1200, th_SADC=1200)
v145 = v145.Filter(th_SAD = 1200, th_SADC=1200)
v146 = v146.Filter(th_SAD = 1200, th_SADC=1200)
v147 = v147.Filter(th_SAD = 1200, th_SADC=1200)
v148 = v148.Filter
v149 = v149.Filter
*/
#return v149.prefetch(6)

v133 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v133.avi").ConvertToYV24()
v133 = v133.trim(1,0)
v134 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v134.avi").ConvertToYV24()
v134 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v134.avi").ConvertToYV24()
v136 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v136.avi").ConvertToYV24()
v137 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v137.avi").ConvertToYV24()
v138 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v138.avi").ConvertToYV24()
v139 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v139.avi").ConvertToYV24()
v140 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v140.avi").ConvertToYV24()
v141 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v141.avi").ConvertToYV24()
v142 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v142.avi").ConvertToYV24()
v143 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v143.avi").ConvertToYV24()
v144 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v144.avi").ConvertToYV24()
v145 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v145.avi").ConvertToYV24()
v146 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v146.avi").ConvertToYV24()
v147 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v147.avi").ConvertToYV24()
v148 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v148.avi").ConvertToYV24()
v149 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_133\v149.avi").ConvertToYV24()

v133 = v133.AdjustColor(ou=25, ov=-12, lo_th=0.1, hi_th=0.1, lock_chan=0, x=400, red=1, grn=0.96, blu=1, gam_mac=true, bluePoints="100,70,180,190").tweak(sat=1.5, coring=false)
v133 = v133.RemoveDirt.assumefps(18)

v134 = v134.AdjustColor(ou=20, ov=-15, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, y=10, red=1, grn=0.96, blu=1, gam_mac=true, bluePoints="100,70,180,180").tweak(sat=1.5, coring=false)
v134_1 = v134.trim(0, 32)
v134_2 = v134.trim(33, -1).ColorYUV(off_u = -6, off_v = 3)
v134_3 = v134.trim(34, -1).ColorYUV(off_u = -10, off_v = 5)
v134_4 = v134.trim(35, -1).ColorYUV(off_u = -6, off_v = 3)
v134_5 = v134.trim(36, 40).ColorYUV(off_u = -14, off_v = 7)
v134_6 = v134.trim(41, 43).ColorYUV(off_u = -19, off_v = 9)
v134_7 = v134.trim(44, -1).ColorYUV(off_u = -17, off_v = 8)
v134_8 = v134.trim(45, 46).ColorYUV(off_u = -11, off_v = 5)
v134_9 = v134.trim(47, 68).ColorYUV(off_u = -7, off_v = 3)
v134_10 = v134.trim(69, 0)
v134 = v134_1 + v134_2 + v134_3 + v134_4 + v134_5 + v134_6 + v134_7 + v134_8 + v134_9 + v134_10
v134 = v134.RemoveDirt.assumefps(18)

v135 = v135.AdjustColor(ou=12, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v135 = v135.RemoveDirt.assumefps(18)

v136 = v136.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v136 = v136.RemoveDirt.assumefps(18)

v137 = v137.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=0.96, blu=1, gam_mac=true, bluePoints="100,70,180,190")
v137_1 = v137.trim(0, 75).tweak(sat=1.3, coring=false)
v137_2 = v137.trim(76, 81).tweak(sat=1.5, coring=false).ColorYUV(off_u = -8, off_v = 4)
v137_3 = v137.trim(82, 89).tweak(sat=1.7, coring=false).ColorYUV(off_u = -12, off_v = 6).autolevels
v137_4 = v137.trim(90, 99).tweak(sat=1.9, coring=false).ColorYUV(off_u = -19, off_v = 9).autolevels
v137_5 = v137.trim(100, 104).tweak(sat=1.7, coring=false).ColorYUV(off_u = -14, off_v = 7).autolevels
v137_6 = v137.trim(105, 108).tweak(sat=1.5, coring=false).ColorYUV(off_u = -10, off_v = 5)
v137_7 = v137.trim(109, 0).tweak(sat=1.3, coring=false)#.ColorYUV(off_u = 3)
v137 = v137_1 + v137_2 + v137_3 + v137_4 + v137_5 + v137_6 + v137_7
v137 = v137.RemoveDirt.assumefps(18)

v138 = v138.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v138 = v138.RemoveDirt.assumefps(18)

v139 = v139.AdjustColor(ou=19, ov=-5, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true, bluePoints="100,70,180,190")
v139_1 = v139.trim(0, 19).tweak(sat=1.5, coring=false)
v139_2 = v139.trim(20, 22).tweak(sat=1.5, coring=false).ColorYUV(off_u = -9, off_v = 4)
v139_3 = v139.trim(23, 24).tweak(sat=1.7, coring=false).ColorYUV(off_u = -20, off_v = 10)
v139_4 = v139.trim(25, 29).tweak(sat=1.9, coring=false).ColorYUV(off_u = -36, off_v = 18)
v139_5 = v139.trim(30, 34).tweak(sat=1.9, coring=false).ColorYUV(off_u = -22, off_v = 11)
v139_6 = v139.trim(35, 41).tweak(sat=1.7, coring=false).ColorYUV(off_u = -10, off_v = 5)
v139_7 = v139.trim(42, 0).tweak(sat=1.5, coring=false)
v139 = v139_1 + v139_2 + v139_3 + v139_4 + v139_5 + v139_6 + v139_7
v139 = v139.RemoveDirt.assumefps(18)

v140 = v140.AdjustColor(ou=19, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=0.96, blu=1, gam_mac=true, bluePoints="100,70,180,190").tweak(sat=2, coring=false)
v140 = v140.RemoveDirt.assumefps(18)

v141 = v141.trim(1, 0)
v141 = v141.AdjustColor(ou=19, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=0.96, blu=1, gam_mac=true, bluePoints="100,70,180,190")
v141_1 = v141.trim(0, 140).tweak(sat=2, coring=false)
v141_2 = v141.trim(141, 154).tweak(sat=2, coring=false).ColorYUV(off_u = -10, off_v = 5)
v141_3 = v141.trim(155, 157).tweak(sat=2, coring=false).ColorYUV(off_u = -16, off_v = 8)
v141_4 = v141.trim(158, 0).tweak(sat=2, coring=false).ColorYUV(off_u = -10, off_v = 5)
v141 = v141_1 + v141_2 + v141_3 + v141_4
v141 = v141.RemoveDirt.assumefps(18)
#return (v141).histogram("levels").prefetch(6)

v142 = v142.AdjustColor(ou=19, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v142 = v142.RemoveDirt.assumefps(18)

v143 = v143.AdjustColor(ou=15, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v143 = v143.RemoveDirt.assumefps(18)

v144 = v144.AdjustColor(ou=10, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v144 = v144.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.5)

v145 = v145.AdjustColor(ou=10, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=100, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v145 = v145.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.5)

v146 = v146.AdjustColor(ou=10, ov=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, x=400, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v146 = v146.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.5)

v147 = v147.trim(1, 0)
v147 = v147.AdjustColor(ou=20, ov=-20, lo_th=0.1, hi_th=0.1, lock_chan=0, x=400, red=1, grn=1.02, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v147 = v147.RemoveDirt.assumefps(18)

v148 = v148.AdjustColor(ou=20, ov=-20, lo_th=0.1, hi_th=0.1, lock_chan=0, x=400, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=1.5, coring=false)
v148 = v148.RemoveDirt.assumefps(18).autolevels(ignore=0.0002, gamma=1.8)

v149 = v149.AdjustColor(ou=20, ov=-20, lo_th=0.1, hi_th=0.1, lock_chan=0, x=400, red=1, grn=1, blu=1, gam_mac=true).tweak(sat=2, coring=false)
v149 = v149.RemoveDirt.assumefps(18)

#last = v134
last = v133+v134+v135+v136+v137+v138+v139+v140+v141+v142+v143+v144+v145+v146+v147+v148+v149

#histogram("levels")

AdjustFrameRate(preset_p = "slowest")
ConvertToYV12
return Prefetch(6)

function Curves(clip c, string "bluePoints")
{
    return StrLen(bluePoints) == 0 ? c : c.\
           ConvertBits(16).ConvertToPlanarRGB.ApplyGradationCurves(bluePoints=bluePoints).ConvertBits(8)
}

function AdjustColor(clip c, int "ou", int "ov", float "red", float "grn", float "blu", int "x", int "y", int "w", int "h",\
                     float "lo_th", float "hi_th", int "scale", int "lock_chan", bool "gam_mac", string "bluePoints")
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

    c = (ou == 0 && ov == 0) ? c : c.ColorYUV(off_u=ou, off_v=ov)
#return c.histogram("levels")
#return c.ConvertToRGB.histogram("levels").ConvertToYV24()

    c = gam_mac ? c.ConvertToRGB().\
       GamMac(LockChan=lock_chan, Scale=scale, loTh=lo_th, hiTh=hi_th, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=x, y=y, w=w, h=h).\
       Curves(bluePoints = bluePoints).\
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

function AdjustDiv2(clip c, int level, int "max_level", float "red", float "grn", float "blu")
{
    red = Default(red, 1)
    grn = Default(grn, 1)
    blu = Default(blu, 1)

    max_level = Default(max_level, 4)

    left = c.crop(0, 0, -c.width/2, 0)
    right = c.crop(c.width - c.width/2, 0, 0, 0)

    level = level + 1

    left = level < max_level ? left.AdjustDiv2(level, max_level, red, grn, blu) :\
    left.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    right =  level < max_level ? right.AdjustDiv2(level, max_level, red, grn, blu) :\
    right.ConvertToRGB().\
    GamMac(LockChan=1, Scale=2, loTh=0, hiTh=0.1, RedMul=red, GrnMul=grn, BluMul=blu, verbosity=5, show=false, x=0, w=0).\
    ConvertToYV24()

    return left.stackhorizontal(right)
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

function PrepareMask(clip c, int "off_y", float "ignore_low", float "ignore_high", int "mask_tolerance", int "border_r", int "border_b")
{
    mask_w = 128
    mask_h = 128

    off_y=default(off_y, 0)
    ignore_low=default(ignore_low, 0.2)
    ignore_high=default(ignore_high, 0.1)
    mask_tolerance=default(mask_tolerance, 100)
    border_r=default(border_r, 0)
    border_b=default(border_b, 0)

#    c = c.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%

    mask = c.crop(0, 0, mask_w, mask_h).\
             colorYUV(off_y = off_y, autowhite=true).extractY.\
             autoLevels(ignore_low=ignore_low, ignore_high=ignore_high, filterRadius=0, minRng=0, border_r=border_r, border_b=border_b, debug=false)

    mask = mask.addBorders(0, 0, c.width - mask_w, c.height - mask_h)
    mask = mask.letterbox(0, c.height - mask_h, 0, c.width - mask_w, color = $ffffff)
    mask = mask.convertToRGB32()
#return mask
    mask = mask.ColorKeyMask($000000, mask_tolerance).Invert("A").showAlpha.convertToRGB32
#return mask
    return mask.MaskUpdate.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%
#    return mask.Spline64Resize(1728, 1296).crop(0, 0, -288, -216) # 120%
}