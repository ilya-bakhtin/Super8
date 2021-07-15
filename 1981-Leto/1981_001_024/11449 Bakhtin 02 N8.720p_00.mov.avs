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

#c1 = LSMASHVideoSource("E:\media\video\Super8\11449 Digitalizace\11449 Bakhtin 01 cast1 S8.720p.mov")
#c1 = c1.assumefps(18)
#c1 = c1.crop(140,4,-140,-4)
#b = BlankClip(c1, length=3000, color=$000000)

#FlipVertical.Reverse()

crop(146,0,-190,-0)
#return last

# 428, 431, 676, 823, 889, 944, 999, 1060, 1121, 1145, 1286, 1563, 1696, 1946, 2051, 2124, 2211, 2386, 2417, 2454, 2493, 2676, 2751, 3017, 3223,
# 3416, 3598, 3749, 3875, 3899, 4085, 4245, 4437, 4461, 4496, 4701, 4940, 5042, 5065, 5116, 5182, 5468, 5525, 5740, 5754, 5946, 6070, 6179, 6292,
# 6493, 6711, 6942, 6979, 7075, 7295, 7489, 7619, 7747, 7785, 7813, 7931, 7988, 8116, 8200, 8207, 8352, 8496, 8632, 8803, 8991, 9177, 9381, 9578,
# 9633, 9715, 9806, 9892, 10060, 10188, 10367, 10512, 10672, 10820, 10902, 11032, 11120, 11470, 11551, 11653, 11701, 11842, 11936, 12119, 12176,
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

v1 = src.trim(428, 430)
v2 = src.trim(432, 659) + src.trim(661, 673)
v3 = src.trim(677, 822)
v4 = src.trim(824, 888)
v5 = src.trim(890, 943)
v6 = src.trim(945, 998)
v7 = src.trim(1000, 1059)
v8 = src.trim(1061, 1115)
v9 = src.trim(1122, 1144)
v10 = src.trim(1145, 1262) + src.trim(1264, 1283)
v11 = src.trim(1286, 1562)
v12 = src.trim(1564, 1694)
v13 = src.trim(1696, 1945)
v14 = src.trim(1948, 2050)
v15 = src.trim(2052, 2122)
v16 = src.trim(2127, 2210)
v17 = src.trim(2212, 2221) + src.trim(2223, 2277) + src.trim(2279, 2384)
v18 = src.trim(2387, 2416)
v19 = src.trim(2418, 2453)
v20 = src.trim(2455, 2492)
v21 = src.trim(2494, 2674)
v22 = src.trim(2677, 2750)
v23 = src.trim(2754, 3014)
v24 = src.trim(3018, 3222)

v111 = src.trim(20711, 20847)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30

global filter16 = true

/*

#******

# 1

#v1 = v1.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v01 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v1f.avi").ConvertToYV24()
v01 = v01.AdjustColor(ou=0, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v01 = v01.convertToYV12
v01 = v01.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v01 = v01.removeDirt
#v01 = v01.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v01 = v01.UnsharpMask(strength=300, radius=3, threshold=1)
#return v01.histogram("levels").prefetch(6)
v01 = v01.adjustBorders
return v01.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)


#v2 = v2.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v02 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v2f.avi").ConvertToYV24()
v02 = v02.AdjustColor(ou=0, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v02 = v02.convertToYV12
v02 = v02.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v02 = v02.removeDirt
#v02 = v02.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v02 = v02.UnsharpMask(strength=300, radius=3, threshold=1)
#return v02.histogram("levels").prefetch(6)
v02 = v02.adjustBorders
return v02.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v3 = v3.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v03 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v3f.avi").ConvertToYV24()
v03 = v03.AdjustColor(ou=0, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v03 = v03.convertToYV12
v03 = v03.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v03 = v03.removeDirt
#v03 = v03.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v03 = v03.UnsharpMask(strength=300, radius=3, threshold=1)
#return v03.histogram("levels").prefetch(6)
v03 = v03.adjustBorders
return v03.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v4 = v4.AdjustColor(-2, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v04 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v4f.avi").ConvertToYV24()
v04 = v04.AdjustColor(ou=2, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v04 = v04.convertToYV12
v04 = v04.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v04 = v04.removeDirt
#v04 = v04.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v04 = v04.UnsharpMask(strength=300, radius=3, threshold=1)
#return v04.histogram("levels").prefetch(6)
v04 = v04.adjustBorders
return v04.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v5 = v5.AdjustColor(-2, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v05 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v5f.avi").ConvertToYV24()
v05 = v05.AdjustColor(ou=2, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v05 = v05.convertToYV12
v05 = v05.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v05 = v05.removeDirt
#v05 = v05.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v05 = v05.UnsharpMask(strength=300, radius=3, threshold=1)
#return v05.histogram("levels").prefetch(6)
v05 = v05.adjustBorders
return v05.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v6 = v6.AdjustColor(-2, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v06 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v6f.avi").ConvertToYV24()
v06 = v06.AdjustColor(ou=2, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v06 = v06.convertToYV12
v06 = v06.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v06 = v06.removeDirt
#v06 = v06.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v06 = v06.UnsharpMask(strength=300, radius=3, threshold=1)
#return v06.histogram("levels").prefetch(6)
v06 = v06.adjustBorders
return v06.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v7 = v7.AdjustColor(6, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v07 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v7f.avi").ConvertToYV24()
v07 = v07.AdjustColor(ou=6, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v07 = v07.convertToYV12
v07 = v07.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v07 = v07.removeDirt
#v07 = v07.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v07 = v07.UnsharpMask(strength=300, radius=3, threshold=1)
#return v07.histogram("levels").prefetch(6)
v07 = v07.adjustBorders
return v07.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v8 = v8.AdjustColor(6, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v08 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v8f.avi").ConvertToYV24()
v08 = v08.AdjustColor(ou=6, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v08 = v08.convertToYV12
v08 = v08.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v08 = v08.removeDirt
#v08 = v08.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v08 = v08.UnsharpMask(strength=300, radius=3, threshold=1)
#return v08.histogram("levels").prefetch(6)
v08 = v08.adjustBorders
return v08.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v9 = v9.AdjustColor(2, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v09 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v9f.avi").ConvertToYV24()
v09 = v09.AdjustColor(ou=2, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v09 = v09.convertToYV12
v09 = v09.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v09 = v09.removeDirt
#v09 = v09.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v09 = v09.UnsharpMask(strength=300, radius=3, threshold=1)
#return v09.histogram("levels").prefetch(6)
v09 = v09.adjustBorders
return v09.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v10 = v10.AdjustColor(2, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v10 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v10f.avi").ConvertToYV24()
v10 = v10.AdjustColor(ou=2, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v10 = v10.convertToYV12
v10 = v10.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v10 = v10.removeDirt
#v10 = v10.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v10 = v10.UnsharpMask(strength=300, radius=3, threshold=1)
#return v10.histogram("levels").prefetch(6)
v10 = v10.adjustBorders
return v10.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v11 = v11.AdjustColor(-2, -6, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v11 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v11f.avi").ConvertToYV24()
v11 = v11.AdjustColor(ou=-2, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v11 = v11.convertToYV12
v11 = v11.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v11 = v11.removeDirt
#v11 = v11.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v11 = v11.UnsharpMask(strength=300, radius=3, threshold=1)
#return v11.histogram("levels").prefetch(6)
v11 = v11.adjustBorders
return v11.assumefps(24).prefetch(6)

#v12 = v12.AdjustColor(0, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v12 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v12f.avi").ConvertToYV24()
v12 = v12.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v12 = v12.convertToYV12
v12 = v12.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v12 = v12.removeDirt
#v12 = v12.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v12 = v12.UnsharpMask(strength=300, radius=3, threshold=1)
#return v12.histogram("levels").prefetch(6)
v12 = v12.adjustBorders
return v12.assumefps(24).prefetch(6)

#v13 = v13.AdjustColor(0, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v13 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v13f.avi").ConvertToYV24()
v13 = v13.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v13 = v13.convertToYV12
v13 = v13.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v13 = v13.removeDirt
#v13 = v13.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v13 = v13.UnsharpMask(strength=300, radius=3, threshold=1)
#return v13.histogram("levels").prefetch(6)
v13 = v13.adjustBorders
return v13.assumefps(24).prefetch(6)

#v14 = v14.AdjustColor(6, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v14 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v14f.avi").ConvertToYV24()
v14 = v14.AdjustColor(ou=6, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v14 = v14.convertToYV12
v14 = v14.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v14 = v14.removeDirt
#v14 = v14.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v14 = v14.UnsharpMask(strength=300, radius=3, threshold=1)
#return v14.histogram("levels").prefetch(6)
v14 = v14.adjustBorders
return v14.assumefps(24).prefetch(6)

#v15 = v15.AdjustColor(2, 0, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v15 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v15f.avi").ConvertToYV24()
v15 = v15.AdjustColor(ou=2, ov=0, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v15 = v15.convertToYV12
v15 = v15.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v15 = v15.removeDirt
#v15 = v15.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v15 = v15.UnsharpMask(strength=300, radius=3, threshold=1)
#return v15.histogram("levels").prefetch(6)
v15 = v15.adjustBorders
return v15.assumefps(24).prefetch(6)

#v16 = v16.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v16 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v16f.avi").ConvertToYV24()
v16 = v16.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v16 = v16.convertToYV12
v16 = v16.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v16 = v16.removeDirt
#v16 = v16.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v16 = v16.UnsharpMask(strength=300, radius=3, threshold=1)
#return v16.histogram("levels").prefetch(6)
v16 = v16.adjustBorders
return v16.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v17 = v17.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v17 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v17f.avi").ConvertToYV24()
v17 = v17.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v17 = v17.convertToYV12
v17 = v17.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v17 = v17.removeDirt
#v17 = v17.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v17 = v17.UnsharpMask(strength=300, radius=3, threshold=1)
#return v17.histogram("levels").prefetch(6)
v17 = v17.adjustBorders
return v17.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v18 = v18.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v18 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v18f.avi").ConvertToYV24()
v18 = v18.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v18 = v18.convertToYV12
v18 = v18.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v18 = v18.removeDirt
#v18 = v18.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v18 = v18.UnsharpMask(strength=300, radius=3, threshold=1)
#return v18.histogram("levels").prefetch(6)
v18 = v18.adjustBorders
return v18.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v19 = v19.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v19f.avi").ConvertToYV24()
v19 = v19.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v19 = v19.convertToYV12
v19 = v19.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v19 = v19.removeDirt
#v19 = v19.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v19 = v19.UnsharpMask(strength=300, radius=3, threshold=1)
#return v19.histogram("levels").prefetch(6)
v19 = v19.adjustBorders
return v19.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v20 = v20.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v20f.avi").ConvertToYV24()
v20 = v20.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v20 = v20.convertToYV12
v20 = v20.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v20 = v20.removeDirt
#v20 = v20.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v20 = v20.UnsharpMask(strength=300, radius=3, threshold=1)
#return v20.histogram("levels").prefetch(6)
v20 = v20.adjustBorders
return v20.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v21 = v21.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v21f.avi").ConvertToYV24()
v21 = v21.AdjustColor(ou=4, ov=-8, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v21 = v21.convertToYV12
v21 = v21.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v21 = v21.removeDirt
#v21 = v21.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v21 = v21.UnsharpMask(strength=300, radius=3, threshold=1)
#return v21.histogram("levels").prefetch(6)
v21 = v21.adjustBorders
return v21.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v22 = v22.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v22f.avi").ConvertToYV24()
v22 = v22.AdjustColor(ou=4, ov=-8, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v22 = v22.convertToYV12
v22 = v22.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v22 = v22.removeDirt
v22 = v22.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v22 = v22.UnsharpMask(strength=300, radius=3, threshold=1)
#return v22.histogram("levels").prefetch(6)
v22 = v22.adjustBorders
return v22.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v23 = v23.AdjustColor(-2, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v23f.avi").ConvertToYV24()
v23 = v23.AdjustColor(ou=2, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v23 = v23.convertToYV12
v23 = v23.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v23 = v23.removeDirt
#v23 = v23.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v23 = v23.UnsharpMask(strength=300, radius=3, threshold=1)
#return v23.histogram("levels").prefetch(6)
v23 = v23.adjustBorders
return v23.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v24 = v24.AdjustColor(2, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v24 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v24f.avi").ConvertToYV24()
v24 = v24.AdjustColor(ou=2, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v24 = v24.convertToYV12
v24 = v24.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v24 = v24.removeDirt
#v24 = v24.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v24 = v24.UnsharpMask(strength=300, radius=3, threshold=1)
#return v24.histogram("levels").prefetch(6)
v24 = v24.adjustBorders
return v24.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

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
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter")
{
    sigma_y = default(sigma_y, 2)
    sigma_c = default(sigma_c, 4)
    th_SAD = default(th_SAD, 900)
    th_SADC = default(th_SADC, 900)
#    dct = default(dct, 0)
    tr = default(tr, 9)
    RefineMotion = default(RefineMotion, true)
    contrasharp = default(contrasharp, true)
    truemotion = default(truemotion, true)

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
    c = sigma_y == 0 ? c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6)
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
/*
v1 = v1.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v2 = v2.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v3 = v3.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v4 = v4.AdjustColor(-2, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustColor(-2, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v6 = v6.AdjustColor(-2, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v7 = v7.AdjustColor(6, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustColor(6, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustColor(2, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v10 = v10.AdjustColor(2, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustColor(-2, -6, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v12 = v12.AdjustColor(0, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v13 = v13.AdjustColor(0, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustColor(6, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v15 = v15.AdjustColor(2, 0, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v16 = v16.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = v22.AdjustColor(4, -8, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = v23.AdjustColor(-2, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v24 = v24.AdjustColor(2, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")

#v111 = v111.AdjustColor(8, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
convertToYV12
Prefetch(6)
*/