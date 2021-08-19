SetFilterMTMode("DEFAULT_MT_MODE", 2)
SetFilterMTMode("SVSuper",1)
SetFilterMTMode("SVAnalyse",1)
SetFilterMTMode("SVSmoothFps",1)
#SetFilterMTMode("FrameRateConverter", 3)
#SetFilterMTMode("LSMASHVideoSource", 3)
#SetFilterMTMode("Reverse", 3)

LoadPlugin("D:\Program Files\MeGUI\tools\lsmash\LSMASHSource.dll")

LSMASHVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\11943 Bakhtin N8 01.720p.mov")
assumefps(18)

crop(145,0,-175,-0)

# 4, 285, 295, 355, 440, 469, 509, 584, 634, 734, 814, 833, 886, 931, 979, 1020, 1126, 1176, 1193, 1340, 1482, 1570, 1615, 1697,
# 1739, 1790, 1876, 1913, 1991, 2157, 2222, 2290, 2330, 2365, 2457, 2497, 2569, 2623, 2686, 2757, 2814, 2895, 2969, 3030, 3078,
# 3158, 3214, 3239, 3545, 3639, 3778, 4185, 4394, 4562, 4743, 4875, 5011, 5141, 5501, 5676, 5905, 5970, 6476, 6739, 6753, 6859,
# 7001, 7120, 7188, 7326, 7438, 7585, 7701, 8043, 8253, 8373, 8655, 8839, 9074, 9082, 9171, 9296, 9472, 9681, 9772, 9989, 10196,
# 10302, 10475, 10622, 10704, 10794, 11030, 11295, 11388, 11399, 11656, 11857, 12054, 12266, 12442, 12547, 12783, 13047, 13218,
# 13418, 13501, 13543, 13630, 13713, 13755, 13803, 13877, 13888, 13941, 14109, 14259, 14372, 14483, 14557, 14622, 14702, 14775,
# 14843, 15064, 15122, 15126, 15148, 15175, 15209, 15258, 15289, 15354, 15485, 15536, 15708, 15813, 15921, 16019, 16123, 16142,
# 16172, 16212, 16243, 16292, 16313, 16327, 16342, 16371, 16417, 16445, 16668, 16761, 16880, 17218, 17515, 17622, 17765, 17966,
# 18070, 18115, 18253, 18354, 18423, 18512, 18582, 18670, 18762, 18944, 18997, 19269, 19437, 19516, 19856, 20132, 20248, 20447,
#

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v128 = src.trim(15175, 15208).crop(0, 0, -8, 0)
v129 = src.trim(15209, 15257).crop(0, 0, -4, 0)
v130 = src.trim(15258, 15288)#.crop(0, 0, -4, 0)
v131 = src.trim(15289, 15353).crop(0, 0, -8, 0)
v132 = src.trim(15354, 15384).crop(0, 0, -4, 0)
v133 = src.trim(15384, 15484).crop(0, 0, -4, 0)
v134 = src.trim(15485, 15535).crop(0, 0, -4, 0)
v135 = src.trim(15536, 15707).crop(0, 0, -4, 0)
v136 = src.trim(15708, 15812).crop(0, 0, -4, 0)
v137 = src.trim(15813, 15920).crop(0, 0, -4, 0)
v138 = src.trim(15922, 16018).crop(0, 0, -12, 0)
v139 = src.trim(16019, 16121).crop(0, 0, -16, 0)
v140 = src.trim(16123, 16141).crop(0, 0, -8, 0)
v141 = src.trim(16142, 16171).crop(0, 0, -4, 0)
v142 = src.trim(16172, 16211)#.crop(0, 0, -4, 0)
v143 = src.trim(16212, 16242).crop(0, 0, -8, 0)
v144 = src.trim(16243, 16291).crop(0, 0, -8, 0)
v145 = src.trim(16292, 16312).crop(0, 0, -8, 0)
v146 = src.trim(16313, 16323).crop(0, 0, -4, 0)
v147 = src.trim(16327, 16341).crop(0, 0, -12, 0)
v148 = src.trim(16348, 16370).crop(0, 0, -8, 0)
v149 = src.trim(16371, 16416).crop(0, 0, -8, 0)
v150 = src.trim(16417, 16443).crop(0, 0, -8, 0)
v151 = src.trim(16480, 16667).crop(0, 0, -16, 0)
v152 = src.trim(16668, 16760).crop(0, 0, -8, 0)
v153 = src.trim(16761, 16879).crop(0, 0, -16, 0)
v154 = src.trim(16880, 17217).crop(0, 0, -8, 0)
v155 = src.trim(17218, 17514).crop(0, 0, -8, 0)
v156 = src.trim(17515, 17621).crop(0, 0, -8, 0)
v157 = src.trim(17622, 17764).crop(0, 0, -12, 0)
v158 = src.trim(17765, 17965).crop(0, 0, -8, 0)
v159 = src.trim(17966, 18069).crop(0, 0, -12, 0)
v160 = src.trim(18071, 18114).crop(0, 0, -12, 0)
#return v160.autolevels(minRng=0, filterRadius=0, border_l=100)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

#******

# 129

/*
v129 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v129f.avi").ConvertToYV24()
v129 = v129.AdjustColor(ou=0, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
#v129 = v129.colorYUV(off_u=2, off_v=-2)
v129 = v129.autolevels(gamma=1.1, minRng=0)
v129 = v129.convertToYV12
v129 = v129.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v129 = v129.removeDirt
v129 = v129.UnsharpMask(strength=300, radius=3, threshold=1)
v129 = v129.adjustBorders
return v129.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v130 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v130f.avi").ConvertToYV24()
v130 = v130.AdjustColor(ou=0, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v130 = v130.colorYUV(off_u=-2, off_v=0)
v130 = v130.autolevels(gamma=1.1, minRng=0)
v130 = v130.convertToYV12
v130 = v130.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v130 = v130.removeDirt
v130 = v130.UnsharpMask(strength=300, radius=3, threshold=1)
v130 = v130.adjustBorders
return v130.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v131 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v131f.avi").ConvertToYV24()
v131 = v131.AdjustColor(ou=-2, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v131 = v131.colorYUV(off_u=-2, off_v=0)
v131 = v131.autolevels(gamma=1.1, minRng=0)
v131 = v131.convertToYV12
v131 = v131.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v131 = v131.removeDirt
v131 = v131.UnsharpMask(strength=300, radius=3, threshold=1)
v131 = v131.adjustBorders
return v131.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v132 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v132f.avi").ConvertToYV24()
v132 = v132.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.02, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
v132 = v132.colorYUV(off_u=-4, off_v=-4)
v132 = v132.autolevels(gamma=1.0, minRng=0)
v132 = v132.convertToYV12
v132 = v132.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v132 = v132.removeDirt
v132 = v132.UnsharpMask(strength=300, radius=3, threshold=1)
v132 = v132.adjustBorders
return v132.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v133 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v133f.avi").ConvertToYV24()
v133 = v133.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.02, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
v133 = v133.colorYUV(off_u=-4, off_v=-4)
#v133 = v133.autolevels(gamma=1.0, minRng=0)
v133 = v133.convertToYV12
v133 = v133.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v133 = v133.removeDirt
v133 = v133.UnsharpMask(strength=300, radius=3, threshold=1)
v133 = v133.adjustBorders
return v133.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v134 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v134f.avi").ConvertToYV24()
v134 = v134.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v134 = v134.colorYUV(off_u=-4, off_v=-4)
#v134 = v134.autolevels(gamma=1.0, minRng=0)
v134 = v134.convertToYV12
v134 = v134.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v134 = v134.removeDirt
v134 = v134.UnsharpMask(strength=300, radius=3, threshold=1)
v134 = v134.adjustBorders
return v134.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v135 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v135f.avi").ConvertToYV24()
v135 = v135.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v135 = v135.colorYUV(off_u=-4, off_v=-4)
#v135 = v135.autolevels(gamma=1.0, minRng=0)
v135 = v135.convertToYV12
v135 = v135.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v135 = v135.removeDirt
v135 = v135.UnsharpMask(strength=300, radius=3, threshold=1)
v135 = v135.adjustBorders
return v135.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v136 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v136f.avi").ConvertToYV24()
v136 = v136.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v136 = v136.colorYUV(off_u=-4, off_v=-4)
#v136 = v136.autolevels(gamma=1.0, minRng=0)
v136 = v136.convertToYV12
v136 = v136.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v136 = v136.removeDirt
v136 = v136.UnsharpMask(strength=300, radius=3, threshold=1)
v136 = v136.adjustBorders
return v136.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v137 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v137f.avi").ConvertToYV24()
v137 = v137.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v137 = v137.colorYUV(off_u=-4, off_v=-4)
#v137 = v137.autolevels(gamma=1.0, minRng=0)
v137 = v137.convertToYV12
v137 = v137.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v137 = v137.removeDirt
v137 = v137.UnsharpMask(strength=300, radius=3, threshold=1)
v137 = v137.adjustBorders
return v137.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v138 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v138f.avi").ConvertToYV24()
v138 = v138.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v138 = v138.colorYUV(off_u=-2, off_v=-2)
v138 = v138.autolevels(gamma=1.1, minRng=0)
v138 = v138.convertToYV12
v138 = v138.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v138 = v138.removeDirt
v138 = v138.UnsharpMask(strength=300, radius=3, threshold=1)
v138 = v138.adjustBorders
return v138.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v139 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v139f.avi").ConvertToYV24()
v139 = v139.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v139 = v139.colorYUV(off_u=-2, off_v=-4)
v139 = v139.autolevels(gamma=1.1, minRng=0)
v139 = v139.convertToYV12
v139 = v139.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v139 = v139.removeDirt
v139 = v139.UnsharpMask(strength=300, radius=3, threshold=1)
v139 = v139.adjustBorders
return v139.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v140 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v140f.avi").ConvertToYV24()
v140 = v140.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v140 = v140.colorYUV(off_u=6, off_v=-6)
#v140 = v140.autolevels(gamma=1.1, minRng=0)
v140 = v140.convertToYV12
v140 = v140.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v140 = v140.removeDirt
v140 = v140.UnsharpMask(strength=300, radius=3, threshold=1)
v140 = v140.adjustBorders
return v140.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v141 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v141f.avi").ConvertToYV24()
v141 = v141.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v141 = v141.colorYUV(off_u=6, off_v=-6)
#v141 = v141.autolevels(gamma=1.1, minRng=0)
v141 = v141.convertToYV12
v141 = v141.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v141 = v141.removeDirt
v141 = v141.UnsharpMask(strength=300, radius=3, threshold=1)
v141 = v141.adjustBorders
return v141.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v142 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v142f.avi").ConvertToYV24()
v142 = v142.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v142 = v142.colorYUV(off_u=6, off_v=-6)
#v142 = v142.autolevels(gamma=1.1, minRng=0)
v142 = v142.convertToYV12
v142 = v142.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v142 = v142.removeDirt
v142 = v142.UnsharpMask(strength=300, radius=3, threshold=1)
v142 = v142.adjustBorders
return v142.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v143 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v143f.avi").ConvertToYV24()
v143 = v143.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v143 = v143.colorYUV(off_u=6, off_v=-6)
#v143 = v143.autolevels(gamma=1.1, minRng=0)
v143 = v143.convertToYV12
v143 = v143.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v143 = v143.removeDirt
v143 = v143.UnsharpMask(strength=300, radius=3, threshold=1)
v143 = v143.adjustBorders
return v143.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v144 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v144f.avi").ConvertToYV24()
v144 = v144.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v144 = v144.colorYUV(off_u=6, off_v=-6)
#v144 = v144.autolevels(gamma=1.1, minRng=0)
v144 = v144.convertToYV12
v144 = v144.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v144 = v144.removeDirt
v144 = v144.UnsharpMask(strength=300, radius=3, threshold=1)
v144 = v144.adjustBorders
return v144.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v145 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v145f.avi").ConvertToYV24()
v145 = v145.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v145 = v145.colorYUV(off_u=6, off_v=-6)
#v145 = v145.autolevels(gamma=1.1, minRng=0)
v145 = v145.convertToYV12
v145 = v145.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v145 = v145.removeDirt
v145 = v145.UnsharpMask(strength=300, radius=3, threshold=1)
v145 = v145.adjustBorders
return v145.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v146 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v146f.avi").ConvertToYV24()
v146 = v146.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v146 = v146.colorYUV(off_u=6, off_v=-6)
#v146 = v146.autolevels(gamma=1.1, minRng=0)
v146 = v146.convertToYV12
v146 = v146.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v146 = v146.removeDirt
v146 = v146.UnsharpMask(strength=300, radius=3, threshold=1)
v146 = v146.adjustBorders
return v146.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v147 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v147f.avi").ConvertToYV24()
v147 = v147.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v147 = v147.colorYUV(off_u=6, off_v=-6)
#v147 = v147.autolevels(gamma=1.1, minRng=0)
v147 = v147.convertToYV12
v147 = v147.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v147 = v147.removeDirt
v147 = v147.UnsharpMask(strength=300, radius=3, threshold=1)
v147 = v147.adjustBorders
return v147.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v148 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v148f.avi").ConvertToYV24()
v148 = v148.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=false) #intentional false
v148 = v148.colorYUV(off_u=6, off_v=-6)
#v148 = v148.autolevels(gamma=1.1, minRng=0)
v148 = v148.convertToYV12
v148 = v148.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v148 = v148.removeDirt
v148 = v148.UnsharpMask(strength=300, radius=3, threshold=1)
v148 = v148.adjustBorders
return v148.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v149 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v149f.avi").ConvertToYV24()
v149 = v149.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v149 = v149.colorYUV(off_u=10, off_v=-10)
#v149 = v149.autolevels(gamma=1.1, minRng=0)
v149 = v149.convertToYV12
v149 = v149.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v149 = v149.removeDirt
v149 = v149.UnsharpMask(strength=300, radius=3, threshold=1)
v149 = v149.adjustBorders
return v149.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v150 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v150f.avi").ConvertToYV24()
v150 = v150.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v150 = v150.colorYUV(off_u=10, off_v=-10)
#v150 = v150.autolevels(gamma=1.1, minRng=0)
v150 = v150.convertToYV12
v150 = v150.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v150 = v150.removeDirt
v150 = v150.UnsharpMask(strength=300, radius=3, threshold=1)
v150 = v150.adjustBorders
return v150.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v151 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v151f.avi").ConvertToYV24()
br_h = 100
br_c = v151.height - br_h
br = v151.trim(58, 58).loop(v151.frameCount).crop(0, br_c, 0, 0)
v151 = v151.stackVertical(br)
v151 = v151.AdjustColor(ou=2, ov=-8, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
v151 = v151.crop(0, 0, 0, -br_h)
#v151 = v151.colorYUV(off_u=10, off_v=-10)
v151 = v151.autolevels(gamma=1.3, minRng=0)
v151 = v151.convertToYV12
v151 = v151.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v151 = v151.removeDirt
v151 = v151.UnsharpMask(strength=300, radius=3, threshold=1)
v151 = v151.adjustBorders
return v151.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v152 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v152f.avi").ConvertToYV24()
v152 = v152.AdjustColor(ou=6, ov=-10, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v152 = v152.colorYUV(off_u=-2, off_v=0)
v152 = v152.autolevels(gamma=1.1, minRng=0)
v152 = v152.convertToYV12
v152 = v152.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v152 = v152.removeDirt
v152 = v152.UnsharpMask(strength=300, radius=3, threshold=1)
v152 = v152.adjustBorders
return v152.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v153 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v153f.avi").ConvertToYV24()
v153 = v153.AdjustColor(ou=6, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v153 = v153.colorYUV(off_u=-2, off_v=0)
v153 = v153.autolevels(gamma=1.2, minRng=0)
v153 = v153.convertToYV12
v153 = v153.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v153 = v153.removeDirt
v153 = v153.UnsharpMask(strength=300, radius=3, threshold=1)
v153 = v153.adjustBorders
return v153.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v154 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v154f.avi").ConvertToYV24()
br_h = 100
br_c = v154.height - br_h
br = v154.trim(222, 222).loop(v154.frameCount).crop(0, 0, 0, -br_c)
v154 = br.stackVertical(v154)
v154 = v154.AdjustColor(ou=6, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v154 = v154.crop(0, br_h, 0, 0)
v154 = v154.colorYUV(off_u=-4, off_v=-4)
v154 = v154.autolevels(gamma=1.2, minRng=0)
v154 = v154.convertToYV12
v154 = v154.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v154 = v154.removeDirt
v154 = v154.UnsharpMask(strength=300, radius=3, threshold=1)
v154 = v154.adjustBorders
return v154.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v155 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v155f.avi").ConvertToYV24()
v155 = v155.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
v155 = v155.colorYUV(off_u=-4, off_v=-4)
v155 = v155.autolevels(gamma=1.2, minRng=0)
v155 = v155.convertToYV12
v155 = v155.Filter(th_SAD=300, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0, fft_sharp=1)
v155 = v155.removeDirt
v155 = v155.UnsharpMask(strength=300, radius=3, threshold=1)
v155 = v155.adjustBorders
return v155.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v156 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v156f.avi").ConvertToYV24()
v156 = v156.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v156 = v156.colorYUV(off_u=-4, off_v=-4)
v156 = v156.autolevels(gamma=1.2, minRng=0)
v156 = v156.convertToYV12
v156 = v156.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v156 = v156.removeDirt
v156 = v156.UnsharpMask(strength=300, radius=3, threshold=1)
v156 = v156.adjustBorders
return v156.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v157 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v157f.avi").ConvertToYV24()
v157 = v157.AdjustColor(ou=6, ov=-8, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v157 = v157.colorYUV(off_u=-2, off_v=-2)
v157 = v157.autolevels(gamma=1.2, minRng=0)
v157 = v157.convertToYV12
v157 = v157.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v157 = v157.removeDirt
v157 = v157.UnsharpMask(strength=300, radius=3, threshold=1)
v157 = v157.adjustBorders
return v157.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v158 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v158f.avi").ConvertToYV24()
v158 = v158.AdjustColor(ou=4, ov=-6, x=300, y=10, w=-0, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v158 = v158.colorYUV(off_u=-2, off_v=-2)
v158 = v158.autolevels(gamma=1.2, minRng=0)
v158 = v158.convertToYV12
v158 = v158.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=2, sigma_c=0, fft_sharp=1)
v158 = v158.removeDirt
v158 = v158.UnsharpMask(strength=300, radius=3, threshold=1)
v158 = v158.adjustBorders
return v158.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v159 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v159f.avi").ConvertToYV24()
br_w = 100
br_c = v159.width - br_w
br = v159.trim(41, 41).loop(v159.frameCount).crop(0, 0, -br_c, 0)
v159 = v159.stackHorizontal(br)
v159 = v159.AdjustColor(ou=4, ov=-6, x=300, y=10, w=-0, h=-10, lo_th=0.2, hi_th=0.1, lock_chan=2, sat=2.3, gam_mac=true)
v159 = v159.crop(0, 0, -br_w, 0)
v159 = v159.colorYUV(off_u=-2, off_v=-2)
v159 = v159.autolevels(gamma=1.5, minRng=0)
v159 = v159.convertToYV12
v159 = v159.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v159 = v159.removeDirt
v159 = v159.UnsharpMask(strength=300, radius=3, threshold=1)
v159 = v159.adjustBorders
return v159.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v160 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v160f.avi").ConvertToYV24()
v160 = v160.AdjustColor(ou=4, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v160 = v160.colorYUV(off_u=-6, off_v=-6)
v160 = v160.autolevels(gamma=1.2, minRng=0)
v160 = v160.convertToYV12
v160 = v160.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v160 = v160.removeDirt
v160 = v160.UnsharpMask(strength=300, radius=3, threshold=1)
v160 = v160.adjustBorders
return v160.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
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
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter", float "fft_sharp")
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
    fft_sharp = default(fft_sharp, 0)

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
    c = (sigma_y == 0 && fft_sharp == 0) ?\
                       c : c.fft3dfilter(bw=64, bh=64, ow=32, oh=32, sigma=sigma_y/8, sigma2=sigma_y/4, sigma3=sigma_y, sigma4=sigma_y, plane=0, wintype=0, bt = 5, ncpu=6, sharpen=fft_sharp)
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
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/