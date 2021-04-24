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

#v72 = src.trim(12177, 12227)
v73 = src.trim(12229, 12410).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v74 = src.trim(12415, 12610).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 7, minRng=0)
v74 = v74.crop(0,0,-8,0)

v75 = src.trim(12612, 12689).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v76 = src.trim(12692, 12823).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v76 = v76.crop(0,0,-12,0)

v77 = src.trim(12834, 13044).autolevels(ignore_low=0.0003, ignore_high=0.001, border_l = 300, border_r = 100, filterRadius = 0, minRng=0)
v77 = v77.crop(0,0,-10,0)

v78 = src.trim(13047, 13129).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v78 = v78.crop(0,0,-12,0)

v79 = src.trim(13131, 13300).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v80 = src.trim(13303, 13463)
v80 = v80.trim(0, 43) + v80.trim(45, 0)
v80 = v80.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v80 = v80.crop(0,0,-8,0)

v81 = src.trim(13465, 13547).autolevels(ignore_low=0.0003, ignore_high=0.0009, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v81 = v81.crop(0,0,-8,0)

v82 = src.trim(13549, 13635).autolevels(ignore_low=0.0003, ignore_high=0.001, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v83 = src.trim(13639, 13884).autolevels(ignore_low=0.0003, ignore_high=0.0009, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v83 = v83.crop(0,0,-8,0)

v84 = src.trim(13887, 14001).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_t = 200, border_r = 100, filterRadius = 0, minRng=0)
v84 = v84.crop(0,0,-8,0)

v85 = src.trim(14004, 14106).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v85 = v85.crop(0,0,-8,0)

v86 = src.trim(14122, 14192).autolevels(ignore_low=0.0003, ignore_high=0.009, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v87 = src.trim(14195, 14254).autolevels(ignore_low=0.0003, ignore_high=0.0009, border_l = 100, border_r = 100, border_b = 200, filterRadius = 0, minRng=0)
v87 = v87.crop(0,0,-10,0)

v88 = src.trim(14256, 14444) + src.trim(14446, 14453)
v88 = v88.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v89 = src.trim(14456, 14717).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v90 = src.trim(14720, 14749).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v91 = src.trim(14753, 15031).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v92 = src.trim(15034, 15367).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v92 = v92.crop(0,0,-16,0)

v93 = src.trim(15369, 15598).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_t = 100, border_r = 100, border_b = 100, filterRadius = 0, minRng=0)
v93 = v93.crop(0,0,-16,0)

v94 = src.trim(15600, 15674).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v95 = src.trim(15676, 15713).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)

v96 = src.trim(15715, 15806).autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 100, border_r = 100, filterRadius = 0, minRng=0)
v96 = v96.crop(0,6,-12,0)
#return v96.histogram("levels")

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30

global filter16 = true

#******

# 73
/*
v73 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v73.avi").ConvertToYV24()
v73 = v73.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v73.prefetch(6)

v73 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v73-.avi").ConvertToYV24()
v73 = v73.AdjustColor(ou=10, ov=-6, sat=1.5, lo_th = 0.0, hi_th = 0.1, red = 0.9, blu = 0.9).removeDirt
v73 = v73.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v73 = v73.adjustBorders
return v73.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v74 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v74.avi").ConvertToYV24()
v74_1 = v74.trim(0,20)
v74_2 = v74.trim(21,0)
v74_1 = v74_1.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v74_2 = v74_2.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v74 = v74_1 + v74_2
return v74.prefetch(6)

v74 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v74-.avi").ConvertToYV24()
v74_1 = v74.trim(0,20)
v74_2 = v74.trim(21,0)
v74_1 = v74_1.AdjustColor(ou=14, ov=-6, sat=1.5, lo_th=0.1, red = 0.9, blu = 0.9).removeDirt
v74_2 = v74_2.AdjustColor(ou=14, ov=-6, sat=1.5, lo_th=0.1, red = 0.9, grn=1.1, blu = 0.8).removeDirt
v74_1 = v74_1.ConvertToYV12.UnsharpMask(strength=100, radius=5, threshold=1)
v74_2 = v74_2.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v74 = v74_1 + v74_2
#v74 = v74.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v74 = v74.adjustBorders
return v74.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v75 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v75.avi").ConvertToYV24()
v75 = v75.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v75.prefetch(6)

v75 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v75-.avi").ConvertToYV24()
v75 = v75.AdjustColor(ou=10, ov=-6, sat=1.5, red = 0.9, blu = 0.96).removeDirt
#v75 = v75.Filter(th_SAD = 300, th_SADC=300, sigma_y=4, sigma_c=8, dct=0)
#v75 = v75.BicubicSharp(r = 3, edges = 0.5, str = 3, mode = 1)
v75 = v75.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v75 = v75.adjustBorders
#return v75.histogram("levels")
return v75.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(12)

v76 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v76.avi").ConvertToYV24()
v76 = v76.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v76.prefetch(6)

v76 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v76-.avi").ConvertToYV24()
v76 = v76.AdjustColor(ou=10, ov=-6, sat=1.5, red = 0.9, blu = 0.9).removeDirt
#v76 = v76.Filter(th_SAD = 300, th_SADC=300, sigma_y=4, sigma_c=8)
#v76 = v76.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
v76 = v76.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v76 = v76.adjustBorders
return v76.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v77 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v77.avi").ConvertToYV24()
v77 = v77.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v77.prefetch(6)

v77 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v77-.avi").ConvertToYV24()
v77 = v77.AdjustColor(ou=10, ov=-6, sat=1.5, lo_th=0.1, red = 1, blu = 0.96).removeDirt
#v77 = v77.Filter(th_SAD = 700, th_SADC=700, sigma_y=16, sigma_c=32)
v77 = v77.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v77 = v77.adjustBorders
return v77.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v78 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v78.avi").ConvertToYV24()
v78 = v78.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v78.prefetch(6)

v78 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v78-.avi").ConvertToYV24()
v78 = v78.AdjustColor(ou=10, ov=-6, sat=1.5, red = 0.9, blu = 0.96).removeDirt
v78 = v78.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
#v78 = v78.Filter(th_SAD = 700, th_SADC=700, sigma_y=4, sigma_c=8)
v78 = v78.adjustBorders
return v78.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v79 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v79.avi").ConvertToYV24()
v79 = v79.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v79.prefetch(6)

v79 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v79-.avi").ConvertToYV24()
v79 = v79.AdjustColor(ou=10, ov=-6, sat=1.5, lo_th=0, hi_th=0, red = 0.9, blu = 0.85).removeDirt
#v79 = v79.Filter(th_SAD = 300, th_SADC=300)
v79 = v79.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
#v79 = v79.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v79 = v79.adjustBorders
return v79.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v80 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v80.avi").ConvertToYV24()
v80 = v80.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v80.prefetch(6)

v80 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v80-.avi").ConvertToYV24()
v80 = v80.AdjustColor(ou=12, ov=-8, sat=1.5, lo_th=0.1, red = 0.9, blu = 0.87).removeDirt
#v80 = v80.Filter(th_SAD = 300, th_SADC=300)
#v80 = v80.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
v80 = v80.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v80 = v80.adjustBorders
return v80.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v81 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v81.avi").ConvertToYV24()
v81 = v81.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v81.prefetch(6)

v81 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v81-.avi").ConvertToYV24()
v81 = v81.AdjustColor(ou=6, ov=-8, sat=1.5, lo_th=0.1, hi_th=0.2, red = 0.9, blu = 0.96).removeDirt
#v81 = v81.Filter(th_SAD = 700, th_SADC=700, sigma_y=16, sigma_c=32)
#v81 = v81.BicubicSharp(r = 3, edges = 0.5, str = 2, mode = 1)
#v81 = v81.aWarpSharp2(thresh=128, blur=5, depth=24)
v81 = v81.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v81 = v81.adjustBorders
#return v81.histogram("levels")
return v81.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v82 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v82.avi").ConvertToYV24()
v82 = v82.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v82.prefetch(6)

v82 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v82-.avi").ConvertToYV24()
v82 = v82.AdjustColor(ou=6, ov=-8, sat=1.5, lo_th=0.1, hi_th=0.2, red = 0.9, blu = 0.9).removeDirt
#v82 = v82.Filter(th_SAD = 700, th_SADC=700, sigma_y=16, sigma_c=32)
#v82 = v82.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
#v82 = v82.aWarpSharp2(thresh=255, blur=5, depth=24)
v82 = v82.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v82 = v82.adjustBorders
return v82.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v83 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v83.avi").ConvertToYV24()
v83 = v83.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v83.prefetch(6)

v83 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v83-.avi").ConvertToYV24()
v83 = v83.AdjustColor(ou=6, ov=-8, sat=1.5, lo_th=0.1, red = 0.9, blu = 0.96).removeDirt
#v83 = v83.Filter(th_SAD = 700, th_SADC=700, sigma_y=8, sigma_c=16)
#v83 = v83.aWarpSharp2(thresh=128, blur=5, depth=24)
v83 = v83.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v83 = v83.adjustBorders
v83_1 = v83.trim(0, 115).assumefps(18)
v83_2 = v83.trim(116, 0).assumefps(24)
return (v83_1.AdjustFrameRate(preset_p = "slowest") + v83_2).convertToYV12.prefetch(6)

v84 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v84.avi").ConvertToYV24()
v84 = v84.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v84.prefetch(6)

v84 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v84-.avi").ConvertToYV24()
v84 = v84.AdjustColor(ou=4, ov=-4, sat=1.5, lo_th=0.1, y=100, h=-200, red = 0.9).removeDirt
#v84 = v84.Filter(th_SAD = 1100, th_SADC=1100, sigma_y=8, sigma_c=16)
#v84 = v84.aWarpSharp2(thresh=128, blur=5, depth=24)
v84 = v84.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v84 = v84.adjustBorders
return v84.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v85 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v85.avi").ConvertToYV24()
v85 = v85.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v85.prefetch(6)

v85 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v85-.avi").ConvertToYV24()
#v85 = v85.Filter(th_SAD = 1100, th_SADC=1100)
v85 = v85.AdjustColor(ou=4, ov=-4, sat=1.5, hi_th=0.2, red = 0.9).removeDirt
#v85 = v85.aWarpSharp2(thresh=128, blur=5, depth=24)
v85 = v85.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v85 = v85.adjustBorders
return v85.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v86 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v86.avi").ConvertToYV24()
v86 = v86.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v86.prefetch(6)

v86 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v86-.avi").ConvertToYV24()
#v86 = v86.Filter(th_SAD = 1100, th_SADC=1100, sigma_y=8, sigma_c=16)
v86 = v86.AdjustColor(ou=10, ov=-10, sat=1.5, lock_chan=1, lo_th=0.02, red=0.9, gam_mac=true).removeDirt
#v86 = v86.aWarpSharp2(thresh=128, blur=5, depth=24)
v86 = v86.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v86 = v86.adjustBorders
return v86.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v87 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v87.avi").ConvertToYV24()
v87 = v87.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v87.prefetch(6)

v87 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v87-.avi").ConvertToYV24()
v87 = v87.trim(0, v87.frameCount - 3)
#v87 = v87.Filter(th_SAD = 1100, th_SADC=1100, sigma_y=8, sigma_c=16)
v87 = v87.AdjustColor(ou=12, ov=-8, sat=1.5, h=-200, red = 0.94, gam_mac=true).removeDirt
#v87 = v87.aWarpSharp2(thresh=128, blur=5, depth=24)
v87 = v87.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v87 = v87.assumefps(12)
v87 = v87.adjustBorders
return v87.AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v88 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v88.avi").ConvertToYV24()
v88 = v88.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v88.prefetch(6)

v88 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v88-.avi").ConvertToYV24()
#v88 = v88.Filter(th_SAD = 300, th_SADC=300)
v88 = v88.AdjustColor(ou=16, ov=-8, sat=1.5, red = 0.9, blu = 0.9, gam_mac=true).removeDirt
#v88 = v88.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
#v88 = v88.aWarpSharp2(thresh=128, blur=5, depth=24)
v88 = v88.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
v88 = v88.adjustBorders
return v88.assumefps(20).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v89 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v89.avi").ConvertToYV24()
v89 = v89.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v89.prefetch(6)

v89 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v89-.avi").ConvertToYV24()
#v89 = v89.Filter(th_SAD = 300, th_SADC=300)
v89 = v89.AdjustColor(ou=12, ov=-12, sat=1.5, red = 0.94, blu = 0.94, gam_mac=true).removeDirt
v89 = v89.ConvertToYV12.UnsharpMask(strength=200, radius=5, threshold=1)
#v89 = v89.aWarpSharp2(thresh=128, blur=5, depth=24)
v89 = v89.adjustBorders
return v89.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v90 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v90.avi").ConvertToYV24()
#v90 = v90.Filter(th_SAD = 300, th_SADC=300)
v90 = v90.AdjustColor(ou=12, ov=-12, sat=1.5, lock_chan=1, red = 1, blu = 0.9, gam_mac=true).removeDirt
#return v90.histogram("levels").prefetch(6)
v90 = v90.adjustBorders
return v90.assumefps(18).AdjustFrameRate(preset_p = "slowest").convertToYV12.prefetch(6)

v91 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v91.avi").ConvertToYV24()
v91 = v91.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v91.prefetch(12)

v91 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v91-.avi").ConvertToYV24()
v91 = v91.AdjustColor(ou=8, ov=-6, sat=1.5, lo_th=0.0, red = 0.96).removeDirt
v91 = v91.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#v91 = v91.BicubicSharp(r = 3, edges = 0.5, str = 1, mode = 1)
#v91 = v91.aWarpSharp2(thresh=128, blur=5, depth=24)
v91 = v91.adjustBorders
return v91.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v92 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v92.avi").ConvertToYV24()
v92 = v92.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v92.prefetch(12)

v92 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v92-.avi").ConvertToYV24()
v92 = v92.AdjustColor(ou=4, ov=0, sat=1.5, red = 0.9, lo_th=0, hi_th=0.2, w = -200).removeDirt
v92 = v92.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#return v92.histogram("levels").prefetch(6)
v92 = v92.adjustBorders
return v92.assumefps(18).AdjustFrameRate(preset_p = "slowest").ConvertToYV12.prefetch(6)

v93 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v93.avi").ConvertToYV24()
v93 = v93.Filter(th_SAD=400, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v93.prefetch(6)

v93 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v93-.avi").ConvertToYV24()
v93 = v93.AdjustColor(ou=6, ov=0, sat=2, red = 0.96, gam_mac=true).removeDirt
v93 = v93.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v93 = v93.adjustBorders
return v93.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v94 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v94.avi").ConvertToYV24()
v94 = v94.AdjustColor(ou=6, ov=-4, sat=1.5, red = 1, blu = 0.9, gam_mac=true).removeDirt
v94 = v94.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v94 = v94.adjustBorders
return v94.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v95 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v95.avi").ConvertToYV24()
v95 = v95.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=true, sigma_y=0, sigma_c=0)
return v95.prefetch(6)

v95 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v95-.avi").ConvertToYV24()
v95 = v95.AdjustColor(ou=8, ov=-8, sat=1.5, gam_mac=true).removeDirt
v95 = v95.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
v95 = v95.adjustBorders
return v95.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

v96 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_073_096\v96.avi").ConvertToYV24()
v96 = v96.AdjustColor(ou=8, ov=-8, sat=1.5, gam_mac=true).removeDirt
v96 = v96.ConvertToYV12.UnsharpMask(strength=300, radius=5, threshold=1)
#return v96.histogram("levels").prefetch(6)
v96 = v96.adjustBorders
return v96.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(6)

#******

#last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
Prefetch(6)
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
    c = c.tweak(sat=0)
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
v1 = v1.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v2 = v2.AdjustColor(14, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v3 = v3.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v4 = v4.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v5 = v5.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v6 = v6.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v7 = v7.AdjustColor(10, -6, 0, 1.5, red_mul = 0.9, blu_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v8 = v8.AdjustColor(12, -8, 0, 1.5, red_mul = 0.9, blu_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v9 = v9.AdjustColor(6, -8, 0, 1.5, red_mul = 0.9, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v10 = v10.AdjustColor(6, -8, 0, 1.5, red_mul = 0.9, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v11 = v11.AdjustColor(6, -8, 0, 1.5, red_mul = 0.9, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v12 = v12.AdjustColor(4, -4, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v13 = v13.AdjustColor(4, -4, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v14 = v14.AdjustColor(4, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v15 = v15.AdjustColor(4, -4, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v16 = v16.AdjustColor(6, -8, 0, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v17 = v17.AdjustColor(8, -8, 0, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v18 = v18.AdjustColor(8, -8, 0, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = v19.AdjustColor(8, -6, 0, 1.5, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v20 = v20.AdjustColor(4, 0, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v21 = v21.AdjustColor(4, 0, 0, 1.5, red_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v22 = v22.AdjustColor(6, -4, 0, 1.5, red_mul = 0.94, blu_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = v23.AdjustColor(6, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v24 = v24.AdjustColor(6, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")

last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21+v22+v23+v24#+v25+v26+v27+v28+v29+v30
#last = v24
Prefetch(6)
return last
*/