SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

#LoadPlugin("D:\Program Files (x86)\MeGUI\tools\lsmash\LSMASHSource.dll")
LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\1981\11449 Bakhtin 02 cast1 N8.720p.mov")
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
# 9633, 9715, 9806, 9892, 10060, 10188, 10367, 10512, 10672, 10820, 10902, 11032, 11120, 11295, 11470, 11551, 11653, 11701, 11842, 11936, 12119, 12176,
# 12228, 12414, 12611, 12691, 12826, 13046, 13130, 13302, 13464, 13548, 13638, 13887, 14003, 14112, 14115, 14122, 14194, 14256, 14455, 14719,
# 14752, 15032, 15368, 15599, 15675, 15714, 15807, 15900, 15930, 16015, 16113, 16155, 16241, 16274, 16330, 16349, 16423, 16463, 16651, 16899, 17071,
# 17145, 17198, 17266, 17407, 17499, 17581, 17699, 17764, 17830, 17947, 18086, 18093, 18317, 18558, 18689, 19040, 19375, 19516, 19531, 19680, 19844,
# 19862, 19907, 19917, 19942, 19974, 20078, 20174, 20239, 20279, 20334, 20424, 20560, 20710, 20848, 20960, 21019, 21119, 21206, 21267, 21294, 21437,
# 21559, 21756, 21938, 22019, 22175, 22227, 22242, 22292, 22329, 22376, 22561, 22637, 22733, 22797, 22877, 22968, 23112, 23223, 23686, 23784,
# 23873, 23937, 24000, 24127, 24244, 24386, 24581, 24769, 24933, 25089, 25267, 25310, 25401, 25533, 25581, 25727, 25894, 26048, 26200, 26308, 26501, 26556, 26687,
# 26964, 27081, 27297, 27390, 27534, 27571, 27656, 27729, 27757, 27917, 27964, 28559, 28616, 28679, 28904, 28953, 29025, 29086, 29162, 29241, 29245,
# 29307, 29457, 29624, 29638, 29769,

global src = last
#return last

#v24 = src.trim(26200, 26305).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v193 = src.trim(26309, 26499).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 200, border_b = 50, filterRadius = 0, minRng=0)
v194 = src.trim(26502, 26554).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v195 = src.trim(26557, 26686).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v196 = src.trim(26688, 26963)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v196 = v196.tweak(bright = -48, cont = 1.5)#.histogram("levels")

v197 = src.trim(26967, 27079).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v198 = src.trim(27081, 27296).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v199 = src.trim(27298, 27389).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v200 = src.trim(27391, 27533).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v201 = src.trim(27535, 27569).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v202 = src.trim(27572, 27655).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v203 = src.trim(27657, 27728).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v204 = src.trim(27730, 27756).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v205 = src.trim(27758, 27915).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v206 = src.trim(27918, 27963).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v207 = src.trim(27965, 28558).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
#v207 = v207.tweak(bright = -24, cont = 1.3)#.histogram("levels")
#v207 = v207.Filter_0.extractY

v208 = src.trim(28563, 28615).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v209 = src.trim(28617, 28678).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

v210 = src.trim(28682, 28866)#.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
#v210 = v210.extractY

v211 = src.trim(28874, 28902).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
#v211 = v211.extractY

v212 = src.trim(28905, 28951).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
#v212 = v212.extractY

v213 = src.trim(28954, 29023).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v214 = src.trim(29026, 29085).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v215 = src.trim(29087, 29161).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)
v216 = src.trim(29162, 29237).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30

global filter16 = true

/*

#******

# 193

v193 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v193f.avi").ConvertToYV24()
#193 v1 = v1.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v193 = v193.AdjustColor(ou=8, ov=-4, x=10, lo_th=0.1, hi_th=0.1, sat=2, red = 0.96, blu = 1, gam_mac=true)
v193 = v193.convertToYV12
v193 = v193.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v193 = v193.removeDirt
v193 = v193.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.1)
v193 = v193.UnsharpMask(strength=300, radius=5, threshold=1)
#return v193.histogram("levels").prefetch(6)
return v193.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v194 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v194f.avi").ConvertToYV24()
#194 v2 = v2.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v194 = v194.AdjustColor(ou=10, ov=-6, x=10, lo_th=0.1, hi_th=0.1, sat=2, red = 0.96, blu = 1, gam_mac=true)
v194 = v194.convertToYV12
v194 = v194.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v194 = v194.removeDirt
v194 = v194.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.1)
v194 = v194.UnsharpMask(strength=300, radius=5, threshold=1)
#return v194.histogram("levels").prefetch(6)
return v194.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v195 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v195f.avi").ConvertToYV24()
#195 v3 = v3.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v195 = v195.AdjustColor(ou=10, ov=-6, x=10, lo_th=0.1, hi_th=0.2, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v195 = v195.convertToYV12
v195 = v195.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v195 = v195.removeDirt
v195 = v195.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v195 = v195.UnsharpMask(strength=300, radius=3, threshold=1)
#return v195.histogram("levels").prefetch(6)
return v195.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v196 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v196f.avi").ConvertToYV24()
#196 v4 = v4.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v196_0 = v196.AdjustColor(ou=10, ov=-6, x=10, lo_th=0.1, hi_th=0.2, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v196_1 = v196.AdjustColor(ou=10, ov=-6, x=10, lo_th=0.1, hi_th=0.05, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v196 = v196_0.trim(0, 161) + v196_1.trim(162, 189) + v196_0.trim(190, 0)
v196 = v196.convertToYV12
v196_0 = v196.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=0, sigma_c=0)
v196_1 = v196.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=0, sigma_c=0)
v196 = v196_0.trim(0, 161) + v196_1.trim(162, 189) + v196_0.trim(190, 0)
v196 = v196.removeDirt
#v196 = v196.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v196 = v196.UnsharpMask(strength=300, radius=3, threshold=1)
#return v196.histogram("levels").prefetch(6)
return v196.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v197 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v197f.avi").ConvertToYV24()
#197 v5 = v5.AdjustColor(4, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v197 = v197.AdjustColor(ou=8, ov=-8, x=300, lo_th=0.1, hi_th=0.2, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v197 = v197.convertToYV12
v197 = v197.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v197 = v197.removeDirt
#v197 = v197.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v197 = v197.UnsharpMask(strength=300, radius=3, threshold=1)
#return v197.histogram("levels").prefetch(6)
return v197.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v198 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v198f.avi").ConvertToYV24()
#198 v6 = v6.AdjustColor(12, -14, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v198 = v198.AdjustColor(ou=12, ov=-14, x=400, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v198 = v198.convertToYV12
v198 = v198.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v198 = v198.removeDirt
#v198 = v198.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v198 = v198.UnsharpMask(strength=300, radius=3, threshold=1)
#return v198.histogram("levels").prefetch(6)
return v198.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v199 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v199f.avi").ConvertToYV24()
#199 v7 = v7.AdjustColor(12, -16, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v199 = v199.AdjustColor(ou=12, ov=-16, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v199 = v199.convertToYV12
v199 = v199.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v199 = v199.removeDirt
#v199 = v199.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v199 = v199.UnsharpMask(strength=300, radius=3, threshold=1)
#return v199.histogram("levels").prefetch(6)
return v199.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v200 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v200f.avi").ConvertToYV24()
#200 v8 = v8.AdjustColor(12, -16, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v200 = v200.AdjustColor(ou=18, ov=-24, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v200 = v200.convertToYV12
v200 = v200.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v200 = v200.removeDirt
#v200 = v200.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v200 = v200.UnsharpMask(strength=300, radius=3, threshold=1)
#return v200.histogram("levels").prefetch(6)
return v200.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v201 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v201f.avi").ConvertToYV24()
#201 v9 = v9.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v201 = v201.AdjustColor(ou=20, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v201 = v201.convertToYV12
v201 = v201.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v201 = v201.removeDirt
#v201 = v201.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v201 = v201.UnsharpMask(strength=300, radius=3, threshold=1)
#return v201.histogram("levels").prefetch(6)
return v201.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v202 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v202f.avi").ConvertToYV24()
#202 v10 = v10.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v202 = v202.AdjustColor(ou=20, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v202 = v202.convertToYV12
v202 = v202.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v202 = v202.removeDirt
#v202 = v202.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v202 = v202.UnsharpMask(strength=300, radius=3, threshold=1)
#return v202.histogram("levels").prefetch(6)
return v202.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v203 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v203f.avi").ConvertToYV24()
#203 v11 = v11.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v203 = v203.AdjustColor(ou=20, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v203 = v203.convertToYV12
v203 = v203.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v203 = v203.removeDirt
#v203 = v203.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v203 = v203.UnsharpMask(strength=300, radius=3, threshold=1)
#return v203.histogram("levels").prefetch(6)
return v203.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v204 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v204f.avi").ConvertToYV24()
#204 v12 = v12.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v204 = v204.AdjustColor(ou=20, ov=-26, x=300, lo_th=0.1, lock_chan=0, hi_th=0.2, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v204 = v204.convertToYV12
v204 = v204.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v204 = v204.removeDirt
#v204 = v204.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v204 = v204.UnsharpMask(strength=300, radius=3, threshold=1)
#return v204.histogram("levels").prefetch(6)
return v204.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v205 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v205f.avi").ConvertToYV24()
#205 v13 = v13.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v205 = v205.AdjustColor(ou=26, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v205 = v205.convertToYV12
v205 = v205.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v205 = v205.removeDirt
#v205 = v205.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v205 = v205.UnsharpMask(strength=300, radius=3, threshold=1)
#return v205.histogram("levels").prefetch(6)
return v205.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v206 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v206f.avi").ConvertToYV24()
#206 v14 = v14.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v206 = v206.AdjustColor(ou=26, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v206 = v206.convertToYV12
v206 = v206.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v206 = v206.removeDirt
#v206 = v206.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v206 = v206.UnsharpMask(strength=300, radius=3, threshold=1)
#return v206.histogram("levels").prefetch(6)
return v206.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v207 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v207f.avi").ConvertToYV24()
#207 v15 = v15.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v207 = v207.AdjustColor(ou=26, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v207 = v207.convertToYV12
v207 = v207.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v207 = v207.removeDirt
#v207 = v207.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v207 = v207.UnsharpMask(strength=300, radius=3, threshold=1)
#return v207.histogram("levels").prefetch(6)
return v207.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v208 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v208f.avi").ConvertToYV24()
#208 v16 = v16.AdjustColor(20, -24, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v208 = v208.AdjustColor(ou=26, ov=-26, x=300, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.88, blu = 1, gam_mac=true)
v208 = v208.convertToYV12
v208 = v208.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v208 = v208.removeDirt
#v208 = v208.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v208 = v208.UnsharpMask(strength=300, radius=3, threshold=1)
#return v208.histogram("levels").prefetch(6)
return v208.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v209 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v209f.avi").ConvertToYV24()
#209 v17 = v17.AdjustColor(20, -24, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v209 = v209.AdjustColor(ou=26, ov=-26, x=300, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.88, blu = 1, gam_mac=true)
v209 = v209.convertToYV12
v209 = v209.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v209 = v209.removeDirt
#v209 = v209.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v209 = v209.UnsharpMask(strength=300, radius=3, threshold=1)
#return v209.histogram("levels").prefetch(6)
return v209.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v210 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v210f.avi").ConvertToYV24()
#210 v18 = v18.AdjustColor(20, -24, 0, 1.5, red_mul = 0.92, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v210 = v210.AdjustColor(ou=20, ov=-24, x=400, lo_th=0.2, hi_th=0.2, lock_chan=0, sat=1.9, red = 0.92, blu = 0.96, gam_mac=true)
v210 = v210.convertToYV12
v210 = v210.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v210 = v210.removeDirt
#v210 = v210.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v210 = v210.UnsharpMask(strength=300, radius=3, threshold=1)
#return v210.histogram("levels").prefetch(6)
return v210.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v211 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v211f.avi").ConvertToYV24()
#211 v19 = v19.AdjustColor(24, -24, 0, 1.5, red_mul = 0.92, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v211 = v211.AdjustColor(ou=24, ov=-24, x=400, lo_th=0.2, hi_th=0.2, lock_chan=0, sat=1.9, red = 0.92, blu = 0.96, gam_mac=true)
v211 = v211.convertToYV12
v211 = v211.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v211 = v211.removeDirt
#v211 = v211.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v211 = v211.UnsharpMask(strength=300, radius=3, threshold=1)
#return v211.histogram("levels").prefetch(6)
return v211.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v212 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v212f.avi").ConvertToYV24()
#212 v20 = v20.AdjustColor(16, -16, 0, 1.5, red_mul = 0.92, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v212 = v212.AdjustColor(ou=24, ov=-24, x=400, y=100, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 0.96, gam_mac=true)
v212 = v212.convertToYV12
v212 = v212.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v212 = v212.removeDirt
#v212 = v212.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v212 = v212.UnsharpMask(strength=300, radius=3, threshold=1)
#return v212.histogram("levels").prefetch(6)
return v212.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v213 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v213f.avi").ConvertToYV24()
#213 v21 = v21.AdjustColor(12, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v213 = v213.AdjustColor(ou=16, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1.01, gam_mac=true)
v213 = v213.convertToYV12
v213 = v213.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v213 = v213.removeDirt
#v213 = v213.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v213 = v213.UnsharpMask(strength=300, radius=3, threshold=1)
#return v213.histogram("levels").prefetch(6)
return v213.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v214 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v214f.avi").ConvertToYV24()
#214 v22 = v22.AdjustColor(12, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v214 = v214.AdjustColor(ou=16, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1.01, gam_mac=true)
v214 = v214.convertToYV12
v214 = v214.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v214 = v214.removeDirt
#v214 = v214.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v214 = v214.UnsharpMask(strength=300, radius=3, threshold=1)
#return v214.histogram("levels").prefetch(6)
return v214.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v215 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v215f.avi").ConvertToYV24()
#215 v23 = v23.AdjustColor(12, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v215 = v215.AdjustColor(ou=16, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1.01, gam_mac=true)
v215 = v215.convertToYV12
v215 = v215.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v215 = v215.removeDirt
#v215 = v215.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v215 = v215.UnsharpMask(strength=300, radius=3, threshold=1)
#return v215.histogram("levels").prefetch(6)
return v215.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v216 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v216f.avi").ConvertToYV24()
#216 v24 = v24.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v216 = v216.AdjustColor(ou=16, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 1, blu = 1, gam_mac=true)
v216 = v216.convertToYV12
v216 = v216.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v216 = v216.removeDirt
#v216 = v216.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v216 = v216.UnsharpMask(strength=300, radius=3, threshold=1)
#return v216.histogram("levels").prefetch(6)
return v216.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

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
#193 v1 = v1.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#194 v2 = v2.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#195 v3 = v3.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#196 v4 = v4.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#197 v5 = v5.AdjustColor(4, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#198 v6 = v6.AdjustColor(12, -14, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#199 v7 = v7.AdjustColor(12, -16, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#200 v8 = v8.AdjustColor(12, -16, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
#201 v9 = v9.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
#202 v10 = v10.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#203 v11 = v11.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#204 v12 = v12.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#205 v13 = v13.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#206 v14 = v14.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#207 v15 = v15.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#208 v16 = v16.AdjustColor(20, -24, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#209 v17 = v17.AdjustColor(20, -24, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#210 v18 = v18.AdjustColor(20, -24, 0, 1.5, red_mul = 0.92, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#211 v19 = v19.AdjustColor(24, -24, 0, 1.5, red_mul = 0.92, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#212 v20 = v20.AdjustColor(16, -16, 0, 1.5, red_mul = 0.92, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#213 v21 = v21.AdjustColor(12, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#214 v22 = v22.AdjustColor(12, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#215 v23 = v23.AdjustColor(12, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
#216 v24 = v24.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
ConvertToYV12
Prefetch(6)
*/