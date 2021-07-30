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
#

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v96 = src.trim(11399, 11655).crop(0, 0, -16, 0)
v97 = src.trim(11656, 11855).crop(0, 0, -16, 0)
v98 = src.trim(11857, 12051).crop(0, 0, -18, 0)
v99 = src.trim(12054, 12265).crop(0, 0, -16, 0)
v100 = src.trim(12266, 12441).crop(0, 0, -18, 0)
v101 = src.trim(12443, 12543).crop(0, 0, -20, 0)
v102 = src.trim(12550, 12782).crop(0, 0, -20, 0)
v103 = src.trim(12793, 13046).crop(0, 0, -16, 0)
v104 = src.trim(13047, 13213).crop(0, 0, -18, 0)
v105 = src.trim(13219, 13417).crop(0, 0, -20, 0)
v106 = src.trim(13418, 13500).crop(0, 0, -22, 0)
v107 = src.trim(13502, 13541).crop(0, 0, -22, 0)
v108 = src.trim(13546, 13628).crop(0, 0, -8, 0)
v109 = src.trim(13635, 13712).crop(0, 0, -8, 0)
v110 = src.trim(13714, 13754).crop(0, 0, -8, 0)
v111 = src.trim(13755, 13802).crop(0, 0, -8, 0)
v112 = src.trim(13804, 13876).crop(0, 0, -4, 0)
#v113 = src.trim(13877, 13887).crop(0, 0, -4, 0)
v113 = src.trim(13888, 13940).crop(0, 0, -12, 0)
v114 = src.trim(13942, 14108).crop(0, 0, -16, 0)
v115 = src.trim(14110, 14258).crop(0, 0, -16, 0)
v116 = src.trim(14260, 14371).crop(0, 0, -16, 0)
v117 = src.trim(14372, 14482).crop(0, 0, -16, 0)
v118 = src.trim(14484, 14556).crop(0, 0, -16, 0)
v119 = src.trim(14558, 14621).crop(0, 0, -16, 0)
v120 = src.trim(14623, 14701).crop(0, 0, -16, 0)
v121 = src.trim(14702, 14775).crop(0, 0, -16, 0)
v122 = src.trim(14776, 14842).crop(0, 0, -16, 0)
v123 = src.trim(14844, 15062).crop(0, 0, -16, 0)
v124 = src.trim(15065, 15121).crop(0, 0, -16, 0)
v125 = src.trim(15123, 15125).crop(0, 0, -16, 0)
v126 = src.trim(15126, 15147).crop(0, 0, -16, 0)
v127 = src.trim(15149, 15173).crop(0, 0, -16, 0)
v128 = src.trim(15175, 15208).crop(0, 0, -8, 0)
#return v128.autolevels(minRng=0, filterRadius=0, border_l=100)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

#******

# 97
/*
v97 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v97f.avi").ConvertToYV24()
v97 = v97.AdjustColor(ou=16, ov=-16, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.3, gam_mac=true)
v97 = v97.colorYUV(off_u=-4, off_v=0)
v97 = v97.autolevels(filterRadius=9, gamma=1.2)
v97 = v97.convertToYV12
v97 = v97.Filter(th_SAD=1000, th_SADC=1200, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v97 = v97.removeDirt
v97 = v97.UnsharpMask(strength=300, radius=3, threshold=1)
v97 = v97.adjustBorders
return v97.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v98 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v98f.avi").ConvertToYV24()
v98 = v98.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v98 = v98.colorYUV(off_u=6, off_v=0)
v98 = v98.autolevels(filterRadius=9, gamma=1.2)
v98 = v98.convertToYV12
v98 = v98.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=6, sigma_c=6)
v98 = v98.removeDirt
v98 = v98.UnsharpMask(strength=300, radius=3, threshold=1)
v98 = v98.adjustBorders
return v98.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v99 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v99f.avi").ConvertToYV24()
v99 = v99.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
#v99 = v99.colorYUV(off_u=6, off_v=0)
v99 = v99.autolevels(filterRadius=9, gamma=1.3)
v99 = v99.convertToYV12
v99 = v99.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=3)
v99 = v99.removeDirt
v99 = v99.UnsharpMask(strength=300, radius=3, threshold=1)
v99 = v99.adjustBorders
return v99.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v100 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v100f.avi").ConvertToYV24()
v100_1 = v100.trim(0, 106)
v100_1 = v100_1.AdjustColor(ou=4, ov=-8, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v100_2 = v100.trim(107, 123)
br_w = 100
br_c = v100_2.width - br_w
br = v100.trim(106, 106).loop(v100_2.frameCount).crop(br_c, 0, 0, 0)
v100_2 = v100_2.stackHorizontal(br)
v100_2 = v100_2.AdjustColor(ou=4, ov=-8, x=0, y=10, w=-0, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v100_2 = v100_2.crop(0, 0, -br_w, 0)
v100_3 = v100.trim(124, 0)
v100_3 = v100_3.AdjustColor(ou=4, ov=-8, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v100 = v100_1 + v100_2 + v100_3
#v100 = v100.AdjustColor(ou=4, ov=-8, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v100 = v100.colorYUV(off_u=6, off_v=0)
v100 = v100.autolevels(autolevel=false, input_low=22, input_high=229, debug=false, gamma=1.3, minRng=0)
v100 = v100.convertToYV12
v100 = v100.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v100 = v100.removeDirt
v100 = v100.UnsharpMask(strength=300, radius=3, threshold=1)
v100 = v100.adjustBorders
return v100.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v101 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v101f.avi").ConvertToYV24()
v101 = v101.AdjustColor(ou=4, ov=-8, x=100, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
#v101 = v101.colorYUV(off_u=6, off_v=0)
v101 = v101.autolevels(gamma=1.5, minRng=0)
v101 = v101.convertToYV12
v101 = v101.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v101 = v101.removeDirt
v101 = v101.UnsharpMask(strength=300, radius=3, threshold=1)
v101 = v101.adjustBorders
return v101.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v102 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v102f.avi").ConvertToYV24()
v102 = v102.AdjustColor(ou=4, ov=-8, x=100, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v102 = v102.colorYUV(off_u=6, off_v=0)
v102 = v102.autolevels(gamma=1.5, minRng=0)
v102 = v102.convertToYV12
v102 = v102.Filter(th_SAD=2000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v102 = v102.removeDirt
v102 = v102.UnsharpMask(strength=300, radius=3, threshold=1)
v102 = v102.adjustBorders
return v102.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v103 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v103f.avi").ConvertToYV24()
v103 = v103.AdjustColor(ou=6, ov=-10, x=100, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v103 = v103.colorYUV(off_u=6, off_v=0)
v103 = v103.autolevels(gamma=1.5, minRng=0)
v103 = v103.convertToYV12
v103 = v103.Filter(th_SAD=2000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v103 = v103.removeDirt
v103 = v103.UnsharpMask(strength=300, radius=3, threshold=1)
v103 = v103.adjustBorders
return v103.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v104 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v104f.avi").ConvertToYV24()
v104_0 = v104.AdjustColor(ou=6, ov=-10, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
br_w = 100
br_c = v104.width - br_w
br = v104.trim(26, 26).loop(v104.frameCount).crop(0, 0, -br_c, 0)
v104 = v104.stackHorizontal(br)
v104 = v104.AdjustColor(ou=6, ov=-10, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v104 = v104.crop(0, 0, -br_w, 0)
v104 = v104_0.trim(0, 58) + v104.trim(59, 68) + v104_0.trim(69, 0)
v104 = v104.colorYUV(off_u=-2, off_v=-2)
v104 = v104.autolevels(autolevel=false, debug=false, input_low=20, input_high=220, gamma=1.3, minRng=0)
v104 = v104.convertToYV12
v104 = v104.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v104 = v104.removeDirt
v104 = v104.UnsharpMask(strength=300, radius=3, threshold=1)
v104 = v104.adjustBorders
return v104.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v105 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v105f.avi").ConvertToYV24()
v105 = v105.AdjustColor(ou=6, ov=-10, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v105 = v105.colorYUV(off_u=-2, off_v=-2)
v105 = v105.autolevels(gamma=1.3, minRng=0)
v105 = v105.convertToYV12
v105 = v105.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v105 = v105.removeDirt
v105 = v105.UnsharpMask(strength=300, radius=3, threshold=1)
v105 = v105.adjustBorders
return v105.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v106 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v106f.avi").ConvertToYV24()
v106 = v106.AdjustColor(ou=6, ov=-10, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v106 = v106.colorYUV(off_u=-2, off_v=-2)
v106 = v106.autolevels(gamma=1.3, minRng=0)
v106 = v106.convertToYV12
v106 = v106.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v106 = v106.removeDirt
v106 = v106.UnsharpMask(strength=300, radius=3, threshold=1)
v106 = v106.adjustBorders
return v106.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v107 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v107f.avi").ConvertToYV24()
v107 = v107.AdjustColor(ou=6, ov=-10, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v107 = v107.colorYUV(off_u=-2, off_v=-2)
v107 = v107.autolevels(gamma=1.3, minRng=0)
v107 = v107.convertToYV12
v107 = v107.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v107 = v107.removeDirt
v107 = v107.UnsharpMask(strength=300, radius=3, threshold=1)
v107 = v107.adjustBorders
return v107.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v108 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v108f.avi").ConvertToYV24()
v108 = v108.AdjustColor(ou=6, ov=-10, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v108 = v108.colorYUV(off_u=0, off_v=-6)
#v108 = v108.autolevels(gamma=1.3, minRng=0)
v108 = v108.convertToYV12
v108 = v108.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v108 = v108.removeDirt
v108 = v108.UnsharpMask(strength=300, radius=3, threshold=1)
v108 = v108.adjustBorders
return v108.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v109 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v109f.avi").ConvertToYV24()
v109 = v109.AdjustColor(ou=6, ov=-10, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v109 = v109.colorYUV(off_u=0, off_v=-6)
#v109 = v109.autolevels(gamma=1.3, minRng=0)
v109 = v109.convertToYV12
v109 = v109.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v109 = v109.removeDirt
v109 = v109.UnsharpMask(strength=300, radius=3, threshold=1)
v109 = v109.adjustBorders
return v109.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v110 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v110f.avi").ConvertToYV24()
v110 = v110.AdjustColor(ou=2, ov=-2, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v110 = v110.colorYUV(off_u=4, off_v=-6)
#v110 = v110.autolevels(gamma=1.3, minRng=0)
v110 = v110.convertToYV12
v110 = v110.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v110 = v110.removeDirt
v110 = v110.UnsharpMask(strength=300, radius=3, threshold=1)
v110 = v110.adjustBorders
return v110.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v111 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v111f.avi").ConvertToYV24()
v111 = v111.AdjustColor(ou=0, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v111 = v111.colorYUV(off_u=0, off_v=-2)
v111 = v111.autolevels(gamma=1.3, minRng=0)
v111 = v111.convertToYV12
v111 = v111.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v111 = v111.removeDirt
v111 = v111.UnsharpMask(strength=300, radius=3, threshold=1)
v111 = v111.adjustBorders
return v111.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v112 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v112f.avi").ConvertToYV24()
v112 = v112.AdjustColor(ou=0, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v112 = v112.colorYUV(off_u=0, off_v=-2)
v112 = v112.autolevels(gamma=1.3, minRng=0)
v112 = v112.convertToYV12
v112 = v112.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v112 = v112.removeDirt
v112 = v112.UnsharpMask(strength=300, radius=3, threshold=1)
v112 = v112.adjustBorders
return v112.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v113 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v113f.avi").ConvertToYV24()
v113 = v113.AdjustColor(ou=0, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v113 = v113.colorYUV(off_u=-4, off_v=-2)
#v113 = v113.autolevels(gamma=1.3, minRng=0)
v113 = v113.convertToYV12
v113 = v113.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v113 = v113.removeDirt
v113 = v113.UnsharpMask(strength=300, radius=3, threshold=1)
v113 = v113.adjustBorders
return v113.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v114 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v114f.avi").ConvertToYV24()
v114 = v114.AdjustColor(ou=0, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v114 = v114.colorYUV(off_u=0, off_v=-2)
#v114 = v114.autolevels(gamma=1.3, minRng=0)
v114 = v114.convertToYV12
v114 = v114.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v114 = v114.removeDirt
v114 = v114.UnsharpMask(strength=300, radius=3, threshold=1)
v114 = v114.adjustBorders
return v114.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v115 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v115f.avi").ConvertToYV24()
v115 = v115.AdjustColor(ou=0, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v115 = v115.colorYUV(off_u=-4, off_v=0)
#v115 = v115.autolevels(gamma=1.3, minRng=0)
v115 = v115.convertToYV12
v115 = v115.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v115 = v115.removeDirt
v115 = v115.UnsharpMask(strength=300, radius=3, threshold=1)
v115 = v115.adjustBorders
return v115.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v116 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v116f.avi").ConvertToYV24()
v116 = v116.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
#v116 = v116.colorYUV(off_u=-4, off_v=0)
#v116 = v116.autolevels(gamma=1.3, minRng=0)
v116 = v116.convertToYV12
v116 = v116.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v116 = v116.removeDirt
v116 = v116.UnsharpMask(strength=300, radius=3, threshold=1)
v116 = v116.adjustBorders
return v116.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v117 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v117f.avi").ConvertToYV24()
v117 = v117.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v117 = v117.colorYUV(off_u=-2, off_v=-2)
#v117 = v117.autolevels(gamma=1.3, minRng=0)
v117 = v117.convertToYV12
v117 = v117.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v117 = v117.removeDirt
v117 = v117.UnsharpMask(strength=300, radius=3, threshold=1)
v117 = v117.adjustBorders
return v117.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v118 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v118f.avi").ConvertToYV24()
v118 = v118.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v118 = v118.colorYUV(off_u=-2, off_v=-2)
#v118 = v118.autolevels(gamma=1.3, minRng=0)
v118 = v118.convertToYV12
v118 = v118.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v118 = v118.removeDirt
v118 = v118.UnsharpMask(strength=300, radius=3, threshold=1)
v118 = v118.adjustBorders
return v118.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v119 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v119f.avi").ConvertToYV24()
v119 = v119.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v119 = v119.colorYUV(off_u=4, off_v=-2)
#v119 = v119.autolevels(gamma=1.3, minRng=0)
v119 = v119.convertToYV12
v119 = v119.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v119 = v119.removeDirt
v119 = v119.UnsharpMask(strength=300, radius=3, threshold=1)
v119 = v119.adjustBorders
return v119.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v120 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v120f.avi").ConvertToYV24()
v120 = v120.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v120 = v120.colorYUV(off_u=4, off_v=-2)
#v120 = v120.autolevels(gamma=1.3, minRng=0)
v120 = v120.convertToYV12
v120 = v120.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v120 = v120.removeDirt
v120 = v120.UnsharpMask(strength=300, radius=3, threshold=1)
v120 = v120.adjustBorders
return v120.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v121 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v121f.avi").ConvertToYV24()
v121 = v121.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v121 = v121.colorYUV(off_u=4, off_v=-2)
#v121 = v121.autolevels(gamma=1.3, minRng=0)
v121 = v121.convertToYV12
v121 = v121.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v121 = v121.removeDirt
v121 = v121.UnsharpMask(strength=300, radius=3, threshold=1)
v121 = v121.adjustBorders
return v121.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v122 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v122f.avi").ConvertToYV24()
v122 = v122.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v122 = v122.colorYUV(off_u=4, off_v=-2)
#v122 = v122.autolevels(gamma=1.3, minRng=0)
v122 = v122.convertToYV12
v122 = v122.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v122 = v122.removeDirt
v122 = v122.UnsharpMask(strength=300, radius=3, threshold=1)
v122 = v122.adjustBorders
return v122.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v123 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v123f.avi").ConvertToYV24()
v123 = v123.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v123 = v123.colorYUV(off_u=4, off_v=-2)
#v123 = v123.autolevels(gamma=1.3, minRng=0)
v123 = v123.convertToYV12
v123 = v123.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v123 = v123.removeDirt
v123 = v123.UnsharpMask(strength=300, radius=3, threshold=1)
v123 = v123.adjustBorders
return v123.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v124 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v124f.avi").ConvertToYV24()
v124 = v124.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v124 = v124.colorYUV(off_u=4, off_v=-2)
v124 = v124.autolevels(gamma=1.3, minRng=0)
v124 = v124.convertToYV12
v124 = v124.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v124 = v124.removeDirt
v124 = v124.UnsharpMask(strength=300, radius=3, threshold=1)
v124 = v124.adjustBorders
return v124.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v125f.avi").ConvertToYV24()
v125 = v125.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
#v125 = v125.colorYUV(off_u=4, off_v=-2)
#v125 = v125.autolevels(gamma=1.3, minRng=0)
v125 = v125.convertToYV12
v125 = v125.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v125 = v125.removeDirt
v125 = v125.UnsharpMask(strength=300, radius=3, threshold=1)
v125 = v125.adjustBorders
return v125.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v126 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v126f.avi").ConvertToYV24()
v126 = v126.AdjustColor(ou=4, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v126 = v126.colorYUV(off_u=-2, off_v=0)
#v126 = v126.autolevels(gamma=1.3, minRng=0)
v126 = v126.convertToYV12
v126 = v126.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v126 = v126.removeDirt
v126 = v126.UnsharpMask(strength=300, radius=3, threshold=1)
v126 = v126.adjustBorders
return v126.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v127 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v127f.avi").ConvertToYV24()
v127 = v127.AdjustColor(ou=4, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
#v127 = v127.colorYUV(off_u=-2, off_v=0)
#v127 = v127.autolevels(gamma=1.3, minRng=0)
v127 = v127.convertToYV12
v127 = v127.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v127 = v127.removeDirt
v127 = v127.UnsharpMask(strength=300, radius=3, threshold=1)
v127 = v127.adjustBorders
return v127.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v128 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v128f.avi").ConvertToYV24()
v128 = v128.AdjustColor(ou=0, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v128 = v128.colorYUV(off_u=2, off_v=-2)
#v128 = v128.autolevels(gamma=1.3, minRng=0)
v128 = v128.convertToYV12
v128 = v128.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v128 = v128.removeDirt
v128 = v128.UnsharpMask(strength=300, radius=3, threshold=1)
v128 = v128.adjustBorders
return v128.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
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
                int "blksize", int "overlap", int "hpad", int "vpad", bool "truemotion", int "prefilter")
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
last = v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30+v32
Prefetch(6)
*/