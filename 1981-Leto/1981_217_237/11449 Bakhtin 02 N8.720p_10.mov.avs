SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

#LoadPlugin("D:\Program Files (x86)\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("d:\users\ilx\wrk\video\Super8\1981\11449 Bakhtin 02 cast1 N8.720p.mov")
assumefps(18)

src2 = LSMASHVideoSource("d:\users\ilx\wrk\video\Super8\1981\11449 Bakhtin 02 cast2 N8.720p.mov")
src2 = src2.assumefps(18)

src3 = LSMASHVideoSource("d:\users\ilx\wrk\video\Super8\1981\11449 Bakhtin 02 cast3 N8.720p.mov")
src3 = src3.assumefps(18)

crop(146,0,-190,-0)
#return last

src2 = src2.crop(146,0,-190,-0)
#return src2

src3 = src3.crop(146,0,-190,-0)
#return src3

# 428, 431, 676, 823, 889, 944, 999, 1060, 1121, 1145, 1286, 1563, 1696, 1946, 2051, 2124, 2211, 2386, 2417, 2454, 2493, 2676, 2751, 3017, 3223,
# 3416, 3598, 3749, 3875, 3899, 4085, 4245, 4437, 4461, 4496, 4701, 4940, 5042, 5065, 5116, 5182, 5468, 5525, 5740, 5754, 5946, 6070, 6179, 6292,
# 6493, 6711, 6942, 6979, 7075, 7295, 7489, 7619, 7747, 7785, 7813, 7931, 7988, 8116, 8200, 8207, 8352, 8496, 8632, 8803, 8991, 9177, 9381, 9578,
# 9633, 9715, 9806, 9892, 10060, 10188, 10367, 10512, 10672, 10820, 10902, 11032, 11120, 11295, 11470, 11551, 11653, 11701, 11842, 11936, 12119, 12176,
# 12228, 12414, 12611, 12691, 12826, 13046, 13130, 13302, 13464, 13548, 13638, 13887, 14003, 14112, 14115, 14122, 14194, 14256, 14455, 14719,
# 14752, 15032, 15368, 15599, 15675, 15714, 15807, 15900, 15930, 16015, 16113, 16155, 16241, 16274, 16330, 16349, 16423, 16463, 16651, 16899, 17071,
# 17145, 17198, 17266, 17407, 17499, 17581, 17699, 17764, 17830, 17947, 18086, 18093, 18317, 18558, 18689, 19040, 19375, 19516, 19531, 19680, 19844,
# 19862, 19907, 19917, 19942, 19974, 20078, 20174, 20239, 20279, 20334, 20424, 20560, 20710, 20848, 20960, 21019, 21119, 21206, 21267, 21294, 21437,
# 21559, 21756, 21938, 22019, 22175, 22227, 22242, 22292, 22329, 22376, 22561, 22637, 22733, 22797, 22877, 22968, 23112, 23223, 23686, 23784,
# 23873, 23937, 24000, 24127, 24244, 24386, 24581, 24769, 24933, 25089, 25267, 25310, 25401, 25533, 25581, 25727, 25894, 26048, 26200, 26308, 26501, 26556, 26687,
# 26964, 27081, 27297, 27390, 27534, 27571, 27656, 27729, 27757, 27917, 27964, 28559, 28616, 28679, 28904, 28953, 29025, 29086, 29162, 29241, 29245,
# 29307, 29457, 29624, 29638, 29769,

#cast2
# 4, 105, 111, 148, 192,

#cast3
# 1, 14, 63, 178, 250, 304, 476, 550, 592, 639, 669, 711, 896, 968, 1042, 1316

global src = last
#return last

#v24 = src.trim(29162, 29237)
v217 = src.trim(29246, 29306).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v218 = src.trim(29308, 29455)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v218 = v218.crop(0,0,-12,0).tweak(bright = -16, cont = 1.7, sat = 1.7, coring = false)#.histogram("levels")

v219 = src.trim(29458, 29621)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v219 = v219.crop(0,0,0,0).tweak(bright = -16, cont = 1.8, sat = 1.7, coring = false)#.histogram("levels")

v220 = src.trim(29639, 29767)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v220 = v220.crop(0,0,-12,-12).tweak(bright = -16, cont = 1.4, sat = 1.4, coring = false)#.histogram("levels")

v221 = src2.trim(4, 103)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v221 = v221.crop(0,0,-16,-12).tweak(bright = -32, cont = 1.8, sat = 1.7, coring = false)#.histogram("levels")

v222 = src2.trim(112, 147).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v223 = src2.trim(149, 192)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v223 = v223.crop(0,10,-12,0).tweak(bright = -16, cont = 1.3, sat = 1.3, coring = false)#.histogram("levels")

v224 = src3.trim(1, 13)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v224 = v224.crop(0,0,-10,-12).tweak(bright = -64, cont = 2, sat = 2, coring = false)#.histogram("levels")

v225 = src3.trim(15, 62)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v225 = v225.crop(0,0,-10,-12).tweak(bright = -64, cont = 1.8, sat = 1.8, coring = false)#.histogram("levels")

v226 = src3.trim(64, 177)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v226 = v226.crop(0,0,-12,0).tweak(bright = -48, cont = 1.6, sat = 1.6, coring = false)#.histogram("levels")

v227 = src3.trim(179, 249)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v227 = v227.crop(0,0,-12,0).tweak(bright = -24, cont = 1.4, sat = 1.4, coring = false)#.histogram("levels")

v228 = src3.trim(251, 303)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v228 = v228.crop(0,0,-12,0).tweak(bright = -16, cont = 1.3, sat = 1.3, coring = false)#.histogram("levels")

v229 = src3.trim(305, 474)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v229 = v229.crop(0,0,-12,0).tweak(bright = -16, cont = 1.3, sat = 1.3, coring = false)#.histogram("levels")

v230 = src3.trim(477, 549)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v230 = v230.crop(0,0,-10,-4).tweak(bright = -16, cont = 1.3, sat = 1.3, coring = false)#.histogram("levels")

v231 = src3.trim(601, 637)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v231_0 = v231.tweak(bright = -82, cont = 1.6, sat = 1.6, coring = false)
v231_1 = v231.tweak(bright = -280, cont = 2.5, sat = 1.6, coring = false)
v231 = (v231_0.trim(0, 6) + v231_1.trim(7, -1) + v231_0.trim(8, 0))#.histogram("levels")

v232 = src3.trim(640, 668).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v233 = src3.trim(670, 704).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v234 = src3.trim(712, 894).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v235 = src3.trim(897, 967).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v236 = src3.trim(969, 1040).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v237 = src3.trim(1043, 1314)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v237 = v237.tweak(bright = -32, cont = 1.2, sat = 1.2, coring = false)#.histogram("levels")

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

/*

#******

# 217

#v1 = v1.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v217 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v217f.avi").ConvertToYV24()
v217 = v217.AdjustColor(ou=12, ov=-14, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v217 = v217.convertToYV12
v217 = v217.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v217 = v217.removeDirt
v217 = v217.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v217 = v217.UnsharpMask(strength=300, radius=3, threshold=1)
#return v217.histogram("levels").prefetch(6)
return v217.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v2 = v2.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v218 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v218f.avi").ConvertToYV24()
v218 = v218.AdjustColor(ou=12, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v218 = v218.convertToYV12
v218 = v218.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v218 = v218.removeDirt
v218 = v218.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v218 = v218.UnsharpMask(strength=300, radius=3, threshold=1)
#return v218.histogram("levels").prefetch(6)
v218 = v218.adjustBorders
return v218.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v3 = v3.AdjustColor(8, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v219 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v219f.avi").ConvertToYV24()
v219 = v219.AdjustColor(ou=8, ov=-10, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v219 = v219.convertToYV12
v219 = v219.Filter(th_SAD=1100, th_SADC=1100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v219 = v219.removeDirt
v219 = v219.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v219 = v219.UnsharpMask(strength=300, radius=3, threshold=1)
#return v219.histogram("levels").prefetch(6)
v219 = v219.adjustBorders
return v219.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v4 = v4.AdjustColor(8, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v220 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v220f.avi").ConvertToYV24()
v220 = v220.AdjustColor(ou=8, ov=-12, x=10, y=100, h=-100, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v220 = v220.convertToYV12
v220 = v220.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v220 = v220.removeDirt
v220 = v220.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v220 = v220.UnsharpMask(strength=300, radius=3, threshold=1)
#return v220.histogram("levels").prefetch(6)
v220 = v220.adjustBorders
return v220.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v5 = v5.AdjustColor(8, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v221 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v221f.avi").ConvertToYV24()
v221 = v221.AdjustColor(ou=8, ov=-12, x=10, y=10, w=-50, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v221 = v221.convertToYV12
v221 = v221.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v221 = v221.removeDirt
v221 = v221.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v221 = v221.UnsharpMask(strength=300, radius=3, threshold=1)
#return v221.histogram("levels").prefetch(6)
v221 = v221.adjustBorders
return v221.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v6 = v6.AdjustColor(12, -16, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v222 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v222f.avi").ConvertToYV24()
v222 = v222.AdjustColor(ou=12, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 1, blu = 1, gam_mac=true)
v222 = v222.convertToYV12
v222 = v222.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v222 = v222.removeDirt
#v222 = v222.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v222 = v222.UnsharpMask(strength=300, radius=3, threshold=1)
#return v222.histogram("levels").prefetch(6)
v222 = v222.adjustBorders
return v222.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v7 = v7.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v223 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v223f.avi").ConvertToYV24()
v223 = v223.AdjustColor(ou=10, ov=-12, x=10, y=100, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v223 = v223.convertToYV12
v223 = v223.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v223 = v223.removeDirt
v223 = v223.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v223 = v223.UnsharpMask(strength=300, radius=3, threshold=1)
#return v223.histogram("levels").prefetch(6)
v223 = v223.adjustBorders
return v223.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v8 = v8.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v224 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v224f.avi").ConvertToYV24()
v224 = v224.AdjustColor(ou=20, ov=-24, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.89, grn = 1, blu = 1, gam_mac=true)
v224 = v224.convertToYV12
v224 = v224.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v224 = v224.removeDirt
#v224 = v224.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v224 = v224.UnsharpMask(strength=300, radius=3, threshold=1)
#return v224.histogram("levels").prefetch(6)
v224 = v224.adjustBorders
return v224.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v9 = v9.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v225 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v225f.avi").ConvertToYV24()
v225 = v225.AdjustColor(ou=16, ov=-18, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.89, grn = 1, blu = 1, gam_mac=true)
v225 = v225.convertToYV12
v225 = v225.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v225 = v225.removeDirt
#v225 = v225.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v225 = v225.UnsharpMask(strength=300, radius=3, threshold=1)
#return v225.histogram("levels").prefetch(6)
v225 = v225.adjustBorders
return v225.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v10 = v10.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v226 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v226f.avi").ConvertToYV24()
v226 = v226.AdjustColor(ou=16, ov=-18, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.72, grn = 0.9, blu = 1, gam_mac=true)
v226 = v226.convertToYV12
#v226 = v226.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=false, sigma_y=0, sigma_c=0)
v226 = v226.removeDirt
#v226 = v226.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v226 = v226.UnsharpMask(strength=300, radius=3, threshold=1)
#return v226.histogram("levels").prefetch(6)
v226 = v226.adjustBorders
return v226.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v11 = v11.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v227 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v227f.avi").ConvertToYV24()
v227 = v227.AdjustColor(ou=10, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, grn = 0.96, blu = 1, gam_mac=true)
v227 = v227.convertToYV12
v227 = v227.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v227 = v227.removeDirt
v227 = v227.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v227 = v227.UnsharpMask(strength=300, radius=3, threshold=1)
#return v227.histogram("levels").prefetch(6)
v227 = v227.adjustBorders
return v227.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v12 = v12.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v228 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v228f.avi").ConvertToYV24()
v228 = v228.AdjustColor(ou=10, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, grn = 0.96, blu = 1, gam_mac=true)
v228 = v228.convertToYV12
v228 = v228.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v228 = v228.removeDirt
v228 = v228.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.4)
v228 = v228.UnsharpMask(strength=300, radius=3, threshold=1)
#return v228.histogram("levels").prefetch(6)
v228 = v228.adjustBorders
return v228.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v13 = v13.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(20).AdjustFrameRate(preset_p = "slowest")
v229 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v229f.avi").ConvertToYV24()
v229 = v229.AdjustColor(ou=10, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.6, red = 0.92, grn = 0.96, blu = 1, gam_mac=true)
v229 = v229.convertToYV12
v229 = v229.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v229 = v229.removeDirt
v229 = v229.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.4)
v229 = v229.UnsharpMask(strength=300, radius=3, threshold=1)
#return v229.histogram("levels").prefetch(6)
v229 = v229.adjustBorders
return v229.assumefps(20).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v14 = v14.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v230 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v230f.avi").ConvertToYV24()
v230 = v230.AdjustColor(ou=10, ov=-12, x=300, y=10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.7, red = 0.92, grn = 0.96, blu = 1, gam_mac=true)
v230 = v230.convertToYV12
v230 = v230.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v230 = v230.removeDirt
v230 = v230.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.4)
v230 = v230.UnsharpMask(strength=300, radius=3, threshold=1)
#return v230.histogram("levels").prefetch(6)
v230 = v230.adjustBorders
return v230.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v15 = v15.AdjustColor(16, -12, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v231 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v231f.avi").ConvertToYV24()
v231 = v231.AdjustColor(ou=16, ov=-12, x=50, y=10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.7, red = 0.96, grn = 1, blu = 1, gam_mac=true)
v231 = v231.convertToYV12
v231 = v231.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v231 = v231.removeDirt
#v231 = v231.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v231 = v231.UnsharpMask(strength=300, radius=3, threshold=1)
#return v231.histogram("levels").prefetch(6)
return v231.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v16 = v16.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v232 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v232f.avi").ConvertToYV24()
v232 = v232.AdjustColor(ou=12, ov=-10, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red = 1, grn = 1, blu = 0.94, gam_mac=true)
v232 = v232.convertToYV12
v232 = v232.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v232 = v232.removeDirt
#v232 = v232.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v232 = v232.UnsharpMask(strength=300, radius=3, threshold=1)
#return v232.histogram("levels").prefetch(6)
return v232.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v17 = v17.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v233 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v233f.avi").ConvertToYV24()
v233 = v233.AdjustColor(ou=12, ov=-10, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.94, grn = 1, blu = 0.94, gam_mac=true)
v233 = v233.convertToYV12
#v233 = v233.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=false, sigma_y=0, sigma_c=0)
v233 = v233.removeDirt
#v233 = v233.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v233 = v233.UnsharpMask(strength=300, radius=3, threshold=1)
#return v233.histogram("levels").prefetch(6)
return v233.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v18 = v18.AdjustColor(12, -10, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v234 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v234f.avi").ConvertToYV24()
v234 = v234.AdjustColor(ou=12, ov=-10, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.94, grn = 1, blu = 1, gam_mac=true)
v234 = v234.convertToYV12
v234 = v234.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v234 = v234.removeDirt
v234 = v234.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.4)
v234 = v234.UnsharpMask(strength=300, radius=3, threshold=1)
#return v234.histogram("levels").prefetch(6)
return v234.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v19 = v19.AdjustColor(16, -10, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v235 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v235f.avi").ConvertToYV24()
v235 = v235.AdjustColor(ou=16, ov=-10, x=10, y=10, lo_th=0.2, hi_th=0.2, lock_chan=0, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v235 = v235.convertToYV12
#v235 = v235.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=false, sigma_y=0, sigma_c=0)
v235 = v235.removeDirt
#v235 = v235.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v235 = v235.UnsharpMask(strength=300, radius=3, threshold=1)
#return v235.histogram("levels").prefetch(6)
return v235.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v20 = v20.AdjustColor(16, -8, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v236 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v236f.avi").ConvertToYV24()
v236 = v236.AdjustColor(ou=16, ov=-8, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.94, grn = 1, blu = 1, gam_mac=true)
v236 = v236.convertToYV12
v236 = v236.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v236 = v236.removeDirt
#v236 = v236.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v236 = v236.UnsharpMask(strength=300, radius=3, threshold=1)
#return v236.histogram("levels").prefetch(6)
return v236.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

#v21 = v21.AdjustColor(22, -12, -32, 1.5, red_mul = 0.96, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v237 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v237f.avi").ConvertToYV24()
v237 = v237.AdjustColor(ou=22, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=1.5, red = 0.96, grn = 1, blu = 0.94, gam_mac=true)
v237 = v237.convertToYV12
#v237 = v237.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=false, sigma_y=0, sigma_c=0)
v237 = v237.removeDirt
v237 = v237.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=0.9)
v237 = v237.UnsharpMask(strength=300, radius=3, threshold=1)
#return v237.histogram("levels").prefetch(6)
return v237.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

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
v1 = v1.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v2 = v2.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v3 = v3.AdjustColor(8, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v4 = v4.AdjustColor(8, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustColor(8, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v6 = v6.AdjustColor(12, -16, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v7 = v7.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v10 = v10.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v12 = v12.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v13 = v13.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(20).AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v15 = v15.AdjustColor(16, -12, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v16 = v16.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustColor(12, -10, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustColor(16, -10, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(16, -8, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(22, -12, -32, 1.5, red_mul = 0.96, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30
#last = v21
convertToYV12
Prefetch(6)
*/