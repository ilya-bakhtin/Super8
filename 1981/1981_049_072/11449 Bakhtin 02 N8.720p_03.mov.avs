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

#v48 = src.trim(9178, 9380)
v49 = src.trim(9382, 9576).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v50 = src.trim(9579, 9632).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v51 = src.trim(9634, 9714).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v52 = src.trim(9716, 9804).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v53 = src.trim(9808, 9891).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v54 = src.trim(9894, 10058).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v55 = src.trim(10062, 10065) + src.trim(10067, 10185)
v55 = v55.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v56 = src.trim(10189, 10366).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v57 = src.trim(10369, 10511).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v58 = src.trim(10514, 10671).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v59 = src.trim(10673, 10819).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v60 = src.trim(10822, 10900).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v61 = src.trim(10903, 11031).crop(0,0,0,-16).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v62 = src.trim(11033, 11118).crop(0,0,0,-10).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v63 = src.trim(11121, 11294).crop(0,0,0,-8).autolevels(ignore_low=0.0003, ignore_high=0.003, border_l = 100, border_r = 100, filterRadius = 9, minRng=0)

v64 = src.trim(11295, 11463).crop(0,0,0,-12).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v65 = src.trim(11471, 11549).crop(0,0,0,-14).autolevels(ignore_low=0.0003, ignore_high=0, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v66 = src.trim(11553, 11651)
v66 = v66.trim(0, 63) + v66.trim(66, 0)
v66 = v66.crop(0,0,-8,-12).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v67 = src.trim(11654, 11700).crop(0,0,-8,-16).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v68 = src.trim(11702, 11841).crop(0,0,-8,-10).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v69 = src.trim(11843, 11935).crop(0,0,-8,-6).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v70 = src.trim(11937, 12118).crop(0,0,-8,-10).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v71 = src.trim(12120, 12173).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 0, border_r = 0, minRng=0)

v72 = src.trim(12177, 12227).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

#v111 = src.trim(15036, 15367) + src.trim(15369, 15598)

global filter16 = true

#******

# 49
/*
v49 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v49.avi").ConvertToYV24()
v49 = v49.AdjustColor(ou=0, ov=0, lo_th=0, hi_th=0, lock_chan=1, sat=2, red = 1, blu = 1, gam_mac=true).RemoveDirt
#v49 = v49.Filter(th_SAD = 300, th_SADC=300)
#v49 = v49.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v49 = v49.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v49 = v49.ColorYUV(off_u=-1, off_v=-6, gain_y=0)
v49 = v49.adjustBorders
return v49.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v50 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v50.avi").ConvertToYV24()
v50 = v50.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v50.prefetch(6)

v50 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v50-.avi").ConvertToYV24()
v50 = v50.AdjustColor(ou=0, ov=-2, lo_th=0, sat=1.5, red = 1, blu = 1, lock_chan=0, gam_mac=true).RemoveDirt
#v50 = v50.Filter(th_SAD = 300, th_SADC=300)
#v50 = v50.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v50 = v50.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v50 = v50.ColorYUV(off_u=-1, off_v=-3, gain_y=0)
v50 = v50.adjustBorders
return v50.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v51 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v51.avi").ConvertToYV24()
v51 = v51.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v51.prefetch(6)

v51 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v51-.avi").ConvertToYV24()
v51 = v51.AdjustColor(ou=0, ov=-2, lo_th=0, sat=1.5, red = 0.92, blu = 0.92, gam_mac=true).RemoveDirt
#v51 = v51.Filter(th_SAD = 300, th_SADC=300)
#v51 = v51.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v51 = v51.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v51 = v51.adjustBorders
return v51.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v52 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v52.avi").ConvertToYV24()
v52 = v52.AdjustColor(ou=0, ov=-2, sat=1.5, red = 0.9, blu = 0.9).RemoveDirt.autolevels(ignore=0, filterRadius = 0, gamma=0.75)
#v52 = v52.Filter(th_SAD = 300, th_SADC=300)
#v52 = v52.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v52 = v52.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#return v52.histogram("levels").prefetch(6)
v52 = v52.adjustBorders
return v52.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v53 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v53.avi").ConvertToYV24()
v53 = v53.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v53.prefetch(6)

v53 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v53-.avi").ConvertToYV24()
v53 = v53.AdjustColor(ou=2, ov=-6, sat=1.5, gam_mac=true).RemoveDirt
#v53 = v53.Filter(th_SAD = 500, th_SADC=500)
#v53 = v53.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v53 = v53.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v53 = v53.adjustBorders
return v53.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v54 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v54.avi").ConvertToYV24()
v54 = v54.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v54.prefetch(6)

v54 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v54-.avi").ConvertToYV24()
v54 = v54.AdjustColor(ou=2, ov=-6, sat=1.5, gam_mac=true).RemoveDirt
#v54 = v54.Filter(th_SAD = 200, th_SADC=200)
#v54 = v54.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v54 = v54.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v54 = v54.adjustBorders
return v54.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v55 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v55.avi").ConvertToYV24()
v55 = v55.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v55.prefetch(6)

v55 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v55-.avi").ConvertToYV24()
v55 = v55.AdjustColor(ou=2, ov=-6, sat=1.5, gam_mac=true).RemoveDirt
#v55 = v55.Filter(th_SAD = 500, th_SADC=500)
#v55 = v55.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v55 = v55.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v55 = v55.adjustBorders
return v55.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v56 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v56.avi").ConvertToYV24()
v56 = v56.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v56.prefetch(6)

v56 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v56-.avi").ConvertToYV24()
v56 = v56.AdjustColor(ou=0, ov=-4, sat=1.5, gam_mac=true).RemoveDirt
#v56 = v56.Filter(th_SAD = 500, th_SADC=500)
#v56 = v56.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v56 = v56.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v56 = v56.adjustBorders
return v56.assumefps(24).prefetch(6) #.AdjustFrameRate(preset_p = "slowest")

v57 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v57.avi").ConvertToYV24()
v57 = v57.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v57.prefetch(6)

v57 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v57-.avi").ConvertToYV24()
v57 = v57.AdjustColor(ou=4, ov=-4, sat=1.5, red = 0.94, blu = 0.94, gam_mac=true).RemoveDirt#.autolevels(ignore=0, filterRadius = 0, gamma=0.875)
#v57 = v57.Filter(th_SAD = 300, th_SADC=300)
#v57 = v57.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v57 = v57.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v57 = v57.adjustBorders
return v57.assumefps(24).prefetch(6) #.AdjustFrameRate(preset_p = "slowest")

v58 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v58.avi").ConvertToYV24()
v58 = v58.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v58.prefetch(6)

v58 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v58-.avi").ConvertToYV24()
v58 = v58.AdjustColor(ou=0, ov=-4, sat=1.5, red = 0.94, blu = 0.94, gam_mac=true).RemoveDirt#.autolevels(ignore=0, filterRadius = 0, gamma=0.875)
#v58 = v58.Filter(th_SAD = 300, th_SADC=300)
#v58 = v58.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v58 = v58.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v58 = v58.adjustBorders
return v58.assumefps(24).prefetch(6) #.AdjustFrameRate(preset_p = "slowest")

v59 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v59.avi").ConvertToYV24()
v59 = v59.AdjustColor(ou=0, ov=0, sat=1.5, red = 0.94, blu = 0.94, gam_mac=true).RemoveDirt
#v59 = v59.Filter(th_SAD = 300, th_SADC=300)
#v59 = v59.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v59 = v59.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v59 = v59.adjustBorders
return v59.assumefps(24).prefetch(6) #.AdjustFrameRate(preset_p = "slowest")

v60 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v60.avi").ConvertToYV24()
v60 = v60.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v60.prefetch(6)

v60 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v60-.avi").ConvertToYV24()
v60 = v60.AdjustColor(ou=0, ov=-2, sat=1.5, red = 0.94, blu = 0.94, gam_mac=true).RemoveDirt
#v60 = v60.Filter(th_SAD = 300, th_SADC=300)
#v60 = v60.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v60 = v60.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v60 = v60.adjustBorders
return v60.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v61 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v61.avi").ConvertToYV24()
v61 = v61.AdjustColor(ou=20, ov=-14, sat=1.5, x=200, red = 1, blu = 1, gam_mac=true).RemoveDirt
#v61 = v61.Filter(th_SAD = 300, th_SADC=300)
#v61 = v61.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v61 = v61.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v61 = v61.ColorYUV(off_u=-6, off_v=-9, gain_y=0)
v61 = v61.adjustBorders
return v61.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v62 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v62.avi").ConvertToYV24()
v62 = v62.AdjustColor(ou=18, ov=-10, sat=1.5, red = 1, blu = 1, gam_mac=true).RemoveDirt
#v62 = v62.Filter(th_SAD = 300, th_SADC=300)
#v62 = v62.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v62 = v62.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v62 = v62.ColorYUV(off_u=-6, off_v=-9, gain_y=0)
v62 = v62.adjustBorders
return v62.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v63 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v63.avi").ConvertToYV24()
v63_1 = v63.trim(0, 91)
v63_2 = v63.trim(72, 129)
v63_3 = v63.trim(110, 0)
v63_1 = v63_1.Filter(th_SAD=500, th_SADC=1100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v63_2 = v63_2.Filter(th_SAD=1100, th_SADC=1100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v63_3 = v63_3.Filter(th_SAD=200, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v63 = v63_1.trim(0, 81) + v63_2.trim(10, v63_2.frameCount - 11) + v63_3.trim(10, 0)
return v63.prefetch(6)

v63 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v63-.avi").ConvertToYV24()
v63 = v63.AdjustColor(ou=12, ov=-12, sat=1.5, gam_mac=true).RemoveDirt
#v63 = v63.Filter(th_SAD = 300, th_SADC=300)
#v63 = v63.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v63 = v63.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v63 = v63.ColorYUV(off_u=-2, off_v=-6, gain_y=0)
v63 = v63.adjustBorders
return v63.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v64o = v64.trim(127, 0)
v64 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v64.avi").ConvertToYV24()
v64o = v64o.Filter(th_SAD=1100, th_SADC=1100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v64 = v64 + v64o.trim(10, 0)
return v64.prefetch(6)

v64 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v64-.avi").ConvertToYV24()
v64 = v64.AdjustColor(ou=8, ov=-8, sat=1.5, gam_mac=true).RemoveDirt
#v64 = v64.Filter(th_SAD = 300, th_SADC=300)
#v64 = v64.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v64 = v64.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v64 = v64.adjustBorders
return v64.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v65o = v65.trim(51, 0)
v65 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v65.avi").ConvertToYV24()
v65 = v65.Filter(th_SAD=200, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
v65o = v65o.Filter(th_SAD=1100, th_SADC=1100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v65 = v65 + v65o.trim(10, 0)
return v65.prefetch(6)

v65 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v65-.avi").ConvertToYV24()
v65 = v65.AdjustColor(ou=6, ov=-8, sat=2, hi_th=0, gam_mac=true).RemoveDirt
#v65 = v65.Filter(th_SAD = 300, th_SADC=300, sigma_y=4, sigma_c=8)
#v65 = v65.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v65 = v65.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v65 = v65.ColorYUV(off_u=-2, off_v=-6, gain_y=0).autolevels(gamma=1.1)
v65 = v65.adjustBorders
return v65.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v66 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v66.avi").ConvertToYV24()
v66 = v66.Filter(th_SAD=400, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v66.prefetch(6)

v66 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v66-.avi").ConvertToYV24()
v66 = v66.AdjustColor(ou=12, ov=-10, lo_th=0.1, hi_th=0, sat=2, x=10, red = 1, gam_mac=true).RemoveDirt
#v66 = v66.Filter(th_SAD = 300, th_SADC=300, sigma_y=4, sigma_c=8)
#v66 = v66.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v66 = v66.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#v66 = v66.autolevels(gamma=1.2)
v66 = v66.ColorYUV(off_u=8, off_v=-12, gain_y=0)#.autolevels(gamma=1.1)
v66 = v66.adjustBorders
return v66.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v67 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v67.avi").ConvertToYV24()
v67 = v67.Filter(th_SAD=800, th_SADC=800, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v67.prefetch(6)

v67 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v67-.avi").ConvertToYV24()
v67 = v67.AdjustColor(ou=4, ov=-4, lo_th=0.1, hi_th=0.2, sat=1.5, red = 0.9, gam_mac=true).RemoveDirt
#v67 = v67.Filter(th_SAD = 300, th_SADC=300, sigma_y=4, sigma_c=8)
#v67 = v67.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v67 = v67.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v67 = v67.adjustBorders
return v67.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v68 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v68.avi").ConvertToYV24()
v68 = v68.Filter(th_SAD=800, th_SADC=800, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v68.prefetch(6)

v68 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v68-.avi").ConvertToYV24()
v68 = v68.AdjustColor(ou=4, ov=-6, lo_th=0.1, hi_th=0.4, sat=1.5, red = 0.9, gam_mac=true).RemoveDirt
#v68 = v68.Filter(th_SAD = 600, th_SADC=600, sigma_y=4, sigma_c=8)
#v68 = v68.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v68 = v68.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v68 = v68.adjustBorders
return v68.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v69 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v69.avi").ConvertToYV24()
v69 = v69.Filter(th_SAD=800, th_SADC=800, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v69.prefetch(6)

v69 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v69-.avi").ConvertToYV24()
v69 = v69.AdjustColor(ou=8, ov=-10, lo_th=0.1, x=200, sat=1.5, red = 0.9, gam_mac=true).RemoveDirt.autolevels(ignore_low=0, gamma=1.3)
#v69 = v69.Filter(th_SAD = 300, th_SADC=300, sigma_y=4, sigma_c=8)
#v69 = v69.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v69 = v69.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v69 = v69.adjustBorders
return v69.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v70 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v70.avi").ConvertToYV24()
v70 = v70.Filter(th_SAD=500, th_SADC=800, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v70.prefetch(6)

v70 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v70-.avi").ConvertToYV24()
v70 = v70.AdjustColor(ou=12, ov=-10, sat=1.5, lo_th=0.01, x=200, red = 0.9, gam_mac=true).RemoveDirt
#v70 = v70.Filter(th_SAD = 300, th_SADC=300)
#v70 = v70.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v70 = v70.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v70 = v70.adjustBorders
return v70.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v71 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v71.avi").ConvertToYV24()
v71 = v71.Filter(th_SAD=400, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v71.prefetch(6)

v71 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v71-.avi").ConvertToYV24()
v71 = v71.AdjustColor(ou=14, ov=-8, sat=1.5, red = 1, blu = 1, gam_mac=true)
#v71 = v71.Filter(th_SAD = 300, th_SADC=300)
#v71 = v71.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v71 = v71.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v71 = v71.ColorYUV(off_u=-4, off_v=-12, gain_y=0)#.autolevels(gamma=1.1)
v71 = v71.adjustBorders
return v71.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v72 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_049_072\v72.avi").ConvertToYV24()
v72 = v72.AdjustColor(ou=14, ov=-8, sat=1.5, red = 0.9, blu = 0.9, gam_mac=true)
#v72 = v72.Filter(th_SAD = 100, th_SADC=100)
#v72 = v72.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v72 = v72.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#return v72.histogram("levels").prefetch(6)
v72 = v72.adjustBorders
return v72.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(6)

#******

#last = v66
last = v49+v50+v51+v52+v53+v54+v55+v56+v57+v58+v59+v60+v61+v62+v63+v64+v65+v66+v67+v68+v69+v70+v71+v72

#histogram("levels")

ConvertToYV12
return last

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
#49 v1 = v1.AdjustColor(0, 0, -64, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#50 v2 = v2.AdjustColor(0, 0, -64, 1.5, red_mul = 0.98, blu_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#51 v3 = v3.AdjustColor(0, -2, 0, 1.5, red_mul = 0.92, blu_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#52 v4 = v4.AdjustColor(0, -2, -64, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#53 v5 = v5.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#54 v6 = v6.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#55 v7 = v7.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#56 v8 = v8.AdjustColor(0, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
#57 v9 = v9.AdjustColor(4, -4, -32, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
#58 v10 = v10.AdjustColor(0, -4, -32, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
#59 v11 = v11.AdjustColor(0, 0, 0, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
#60 v12 = v12.AdjustColor(0, -2, 0, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#61 v13 = v13.AdjustColor(12, -10, 0, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#62 v14 = v14.AdjustColor(12, -10, 0, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#63 v15 = v15.AdjustColor(6, -6, 0, 1.5).assumefps(16).AdjustFrameRate(preset_p = "slowest")
#64 v16 = v16.AdjustColor(8, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#65 v17 = v17.AdjustColor(6, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#66 v18 = v18.AdjustColor(6, -6, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#67 v19 = v19.AdjustColor(4, -4, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#68 v20 = v20.AdjustColor(4, -6, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#69 v21 = v21.AdjustColor(4, -6, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#70 v22 = v22.AdjustColor(8, -6, 0, 1.5, red_mul = 0.9).assumefps(16).AdjustFrameRate(preset_p = "slowest")
#71 v23 = v23.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(16).AdjustFrameRate(preset_p = "slowest")
#72 v24 = v24.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(16).AdjustFrameRate(preset_p = "slowest")

#v111 = v111.AdjustColor(4, 0, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
Prefetch(6)
*/