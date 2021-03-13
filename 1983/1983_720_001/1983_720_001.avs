LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\Users\ilx\wrk\video\Super8\1983\8mm film 1.1080p.mov")
assumefps(18)

trim(1, 21373)

crop(240, 0, -240, 0)

Spline64resize(960, 720)
src = last

#return last

# 59, 214, 251, 291, 389, 484, 571, 623, 668, 777, 985, 1139, 1189, 1236, 1459, 1538, 1781, 2018, 2075, 2311, 2361, 2476,
# 2751, 2803, 2882, 3086, 3191, 3227, 3362, 3447, 3702, 3736, 3920, 4143, 4195, 4381, 4623, 4701, 4738, 5017, 5075, 5284,
# 5378, 5586, 5722, 5846, 6151, 6320, 6501, 6582, 6703, 6797, 6806, 6910, 6992, 7165, 7378, 7556, 7673, 7818, 8043, 8186,
# 8364, 8482, 8646, 8841, 9019, 9217, 9419, 9663, 9988, 10219, 10408, 10606, 10614, 10814, 10886, 11185, 11354, 11423,
# 11674, 11843, 11965, 12197, 12282, 12511, 12691, 12751, 12894, 13008, 13157, 13349, 13528, 13622, 13683, 13801, 14126,
# 14360, 14448, 14511, 14626, 14789, 14959, 15100, 15381, 15523, 15641, 15925, 16109, 16294, 16598, 16765, 16777, 16795,
# 16920, 17110, 17214, 17307, 17393, 17483, 17616, 17689, 17829, 17939, 18162, 18169, 18450, 18471, 18698, 18769, 18850,
#

v001 = src.trim(1, 57).autolevels(ignore=0.0005, filterRadius = 0)
v002 = src.trim(59, 213).autolevels(ignore=0.0005, filterRadius = 0)
v003 = src.trim(214, 250).autolevels(ignore=0.0005, filterRadius = 0)
v004 = src.trim(251, 290).autolevels(ignore=0.0005, filterRadius = 0)
v005 = src.trim(291, 388).autolevels(ignore=0.0005, filterRadius = 0)
v006 = src.trim(389, 483).autolevels(ignore=0.0005, filterRadius = 0)
v007 = src.trim(484, 570).autolevels(ignore=0.0005, filterRadius = 0)
v008 = src.trim(571, 622).autolevels(ignore=0.0005, filterRadius = 0)
v009 = src.trim(623, 667).autolevels(ignore=0.0005, filterRadius = 0)
v010 = (src.trim(668, 693) + src.trim(695, 776)).autolevels(ignore=0.0005, filterRadius = 0)
v011 = src.trim(777, 984).autolevels(ignore=0.0005, filterRadius = 0)
v012 = src.trim(985, 1138).autolevels(ignore=0.0003, filterRadius = 0)
v013 = src.trim(1139, 1188).autolevels(ignore=0.0003, filterRadius = 0)
v014 = src.trim(1189, 1235).autolevels(ignore=0.0003, filterRadius = 0)
v015 = src.trim(1236, 1458).autolevels(ignore=0.0003, filterRadius = 0)
v016 = src.trim(1459, 1537).autolevels(ignore=0.0003, filterRadius = 0)
v017 = src.trim(1538, 1780).autolevels(ignore=0.0003, filterRadius = 0)
v018 = src.trim(1781, 2017).autolevels(ignore=0.0003, filterRadius = 0)
v019 = src.trim(2018, 2073).autolevels(ignore=0.0003, filterRadius = 0)
v020 = src.trim(2076, 2310).autolevels(ignore=0.0003, filterRadius = 0)
v021 = src.trim(2311, 2360).autolevels(ignore=0.0003, filterRadius = 0)
v022 = src.trim(2361, 2475).autolevels(ignore=0.0003, filterRadius = 0)
v023 = src.trim(2477, 2750).autolevels(ignore=0.0003, filterRadius = 0)
v024 = src.trim(2751, 2802).autolevels(ignore=0.0003, filterRadius = 0)
v025 = src.trim(2803, 2881).autolevels(ignore=0.0003, filterRadius = 0)
v026 = src.trim(2882, 3085).autolevels(ignore=0.0003, filterRadius = 0)
v027 = src.trim(3086, 3190).autolevels(ignore=0.0003, filterRadius = 0)
v028 = src.trim(3191, 3226).autolevels(ignore=0.0003, filterRadius = 0)
v029 = src.trim(3227, 3361).autolevels(ignore=0.0003, filterRadius = 0)
v030 = src.trim(3362, 3446).autolevels(ignore=0.0003, filterRadius = 0)
v031 = src.trim(3447, 3701).autolevels(ignore=0.0003, filterRadius = 0)
v032 = src.trim(3703, 3735).autolevels(ignore=0.0003, filterRadius = 0)
v033 = src.trim(3736, 3919).autolevels(ignore=0.0003, filterRadius = 0)
#return v033.histogram("levels")

/*
v001 = v001.Filter
v002 = v002.Filter
*/
v003 = v003.Filter
/*
v004 = v004.Filter
v005 = v005.Filter
v006 = v006.Filter
v007 = v007.Filter
*/
v008 = v008.Filter
/*
v009 = v009.Filter
v010 = v010.Filter
v011 = v011.Filter
v012 = v012.Filter
v013 = v013.Filter
v014 = v014.Filter
v015 = v015.Filter
v016 = v016.Filter
v017 = v017.Filter
v018 = v018.Filter
*/
v019 = v019.Filter
/*
v020 = v020.Filter
v021 = v021.Filter
v022 = v022.Filter
v023 = v023.Filter
v024 = v024.Filter
v025 = v025.Filter
v026 = v026.Filter
v027 = v027.Filter
v028 = v028.Filter
v029 = v029.Filter
v030 = v030.Filter
v031 = v031.Filter
v032 = v032.Filter
v033 = v033.Filter
*/
#return v033.prefetch(6)

v001 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_001.avi").ConvertToYV24()
v002 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_002.avi").ConvertToYV24()
#v003 as is
v004 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_004.avi").ConvertToYV24()
v005 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_005.avi").ConvertToYV24()
v006 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_006.avi").ConvertToYV24()
v007 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_007.avi").ConvertToYV24()
#v008 as is
v009 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_009.avi").ConvertToYV24()
v010 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_010.avi").ConvertToYV24()
v011 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_011.avi").ConvertToYV24()
v012 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_012.avi").ConvertToYV24()
v013 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_013.avi").ConvertToYV24()
v014 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_014.avi").ConvertToYV24()
v015 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_015.avi").ConvertToYV24()
v016 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_016.avi").ConvertToYV24()
v017 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_017.avi").ConvertToYV24()
v018 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_018.avi").ConvertToYV24()
#v019 as is
v020 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_020.avi").ConvertToYV24()
v021 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_021.avi").ConvertToYV24()
v022 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_022.avi").ConvertToYV24()
v023 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_023.avi").ConvertToYV24()
v024 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_024.avi").ConvertToYV24()
v025 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_025.avi").ConvertToYV24()
v026 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_026.avi").ConvertToYV24()
v027 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_027.avi").ConvertToYV24()
v028 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_028.avi").ConvertToYV24()
v029 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_029.avi").ConvertToYV24()
v030 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_030.avi").ConvertToYV24()
v031 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_031.avi").ConvertToYV24()
v032 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_032.avi").ConvertToYV24()
v033 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1983\1983_720_001\1983_720_001_033.avi").ConvertToYV24()

v001 = v001.AdjustColor(ou=8, ov=-5)
v001 = v001.autolevels(ignore_low=0.004, ignore_high=0.004, filterRadius = 0, autolevel=true, gamma=2)
v001 = v001.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v002 = v002.AdjustColor(ou=8, ov=-9, red = 0.92).tweak(sat=2, coring=false)
v002 = v002.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v003 = v003.AdjustColor(ou=10, ov=-13, red = 0.92).tweak(sat=2, coring=false)
v003 = v003.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v004 = v004.AdjustColor(ou=10, ov=-13, red = 0.92).tweak(sat=1.5, coring=false)
v004 = v004.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v005 = v005.AdjustColor(ou=14, ov=-15, red = 0.92).tweak(sat=2, coring=false)
v005 = v005.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v006 = v006.AdjustColor(ou=14, ov=-15, red = 0.89).tweak(sat=2, coring=false)
v006 = v006.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v007 = v007.AdjustColor(ou=14, ov=-15, x=480, red = 0.89).tweak(sat=2, coring=false)
v007 = v007.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v008 = v008.AdjustColor(ou=14, ov=-15, x=480, red = 0.89).tweak(sat=2, coring=false)
v008 = v008.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v009 = v009.AdjustColor(ou=14, ov=-15, x=480, red = 0.89).tweak(sat=2, coring=false)
v009 = v009.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v010 = v010.AdjustColor(ou=14, ov=-15, x=480, red = 0.87, grn = 0.94).tweak(sat=2, coring=false)
v010 = v010.autolevels(ignore_low=0.004, ignore_high=0.004, filterRadius = 0, autolevel=true, gamma=1.4)
v010 = v010.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v011 = v011.AdjustColor(ou=14, ov=-15, x=480, red = 0.87, grn = 0.94).tweak(sat=2, coring=false)
v011 = v011.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v012 = v012.AdjustColor(ou=18, ov=-15, x=480, red = 0.87, grn = 0.94).tweak(sat=2, coring=false)
v012 = v012.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v013 = v013.AdjustColor(ou=18, ov=-15, x=480, red = 0.87, grn = 0.94).tweak(sat=2, coring=false)
v013 = v013.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v014 = v014.AdjustColor(ou=24, ov=-17, x=480, red = 1, grn = 1).tweak(sat=2, coring=false)
v014 = v014.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v015 = v015.AdjustColor(ou=24, ov=-17, x=480, red = 0.9, grn = 1).tweak(sat=2, coring=false)
v015 = v015.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v016 = v016.AdjustColor(ou=24, ov=-17, x=480, red = 0.9, grn = 1).tweak(sat=2, coring=false)
v016 = v016.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v017 = v017.AdjustColor(ou=24, ov=-17, x=480, red = 0.9, grn = 1).tweak(sat=2, coring=false)
v017 = v017.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v018 = v018.AdjustColor(ou=24, ov=-17, x=480, red = 0.9, grn = 1).tweak(sat=2, coring=false)
v018 = v018.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v019 = v019.AdjustColor(ou=34, ov=-27, x=480, red = 0.9, grn = 1).tweak(sat=2, coring=false)
v019 = v019.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v020 = v020.AdjustColor(ou=20, ov=-13, x=50, lo_th=0.1, blu=0.96).tweak(sat=2, coring=false)
v020 = v020.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v021 = v021.AdjustColor(ou=20, ov=-13, lo_th=0.1, red=0.96, blu=0.96).tweak(sat=2, coring=false)
v021 = v021.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v022 = v022.AdjustColor(ou=10, ov=-7, lo_th=0.1, red=0.96, blu=0.96).tweak(sat=2, coring=false)
v022 = v022.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v023 = v023.AdjustColor(ou=8, ov=-5, lo_th=0.0, red=0.96, blu=0.96).tweak(sat=2, coring=false)
v023 = v023.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v024 = v024.AdjustColor(ou=8, ov=-5, lo_th=0.0, red=0.90, blu=0.98).tweak(sat=2, coring=false)
v024 = v024.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v025 = v025.AdjustColor(ou=8, ov=-5, lo_th=0.0, red=0.96, blu=0.96).tweak(sat=2, coring=false)
v025 = v025.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v026 = v026.AdjustColor(ou=8, ov=-5, lo_th=0.0, red=0.96, blu=0.96).tweak(sat=2, coring=false)
v026 = v026.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v027 = v027.AdjustColor(ou=8, ov=-5, lo_th=0.0).tweak(sat=2, coring=false)
v027 = v027.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v028 = v028.AdjustColor(ou=8, ov=-5, lo_th=0.0).tweak(sat=2, coring=false)
v028 = v028.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v029 = v029.AdjustColor(ou=8, ov=-5, lo_th=0.0).tweak(sat=2, coring=false)
v029 = v029.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v030 = v030.AdjustColor(ou=12, ov=-10, lo_th=0.0, gam_mac = false).tweak(sat=2, coring=false)
v030 = v030.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v031 = v031.AdjustColor(ou=8, ov=-5, lo_th=0.0, red=0.94).tweak(sat=2, coring=false)
v031 = v031.autolevels(ignore_low=0.004, ignore_high=0.004, filterRadius = 0, autolevel=true, gamma=1.4)
v031 = v031.trim(1, 0)
v031 = v031.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v032 = v032.AdjustColor(ou=12, ov=-10, lo_th=0.0, red = 0.94).tweak(sat=2, coring=false)
v032 = v032.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

v033 = v033.AdjustColor(ou=12, ov=-10, lo_th=0.0, red = 0.94).tweak(sat=2, coring=false)
v033 = v033.trim(1, v033.FrameCount - 2)
v033 = v033.RemoveDirt.assumefps(18).AdjustFrameRate(preset_p = "slowest")

#last = v018
last = v001+v002+v003+v004+v005+v006+v007+v008+v009+v010+v011+v012+v013+v014+v015+v016+v017+\
       v018+v019+v020+v021+v022+v023+v024+v025+v026+v027+v028+v029+v030+v031+v032+v033

#histogram("levels")
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

function Filter(clip c, float "sigma_y", float "sigma_c")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)

    c = c.SMDegrain(tr=9, thSAD=900, thSADC=900, RefineMotion=true, prefilter=2)
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
