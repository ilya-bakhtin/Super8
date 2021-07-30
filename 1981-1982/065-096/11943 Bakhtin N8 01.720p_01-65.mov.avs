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

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v64 = src.trim(6753, 6858).crop(0, 0, -8, 0)
v65 = src.trim(6859, 7000).crop(0, 0, -8, 0)
v66 = src.trim(7002, 7119).crop(0, 0, -10, 0)
v67 = src.trim(7120, 7187).crop(0, 0, -8, 0)
v68 = src.trim(7188, 7324).crop(0, 0, -10, 0)
v69 = src.trim(7327, 7434).crop(0, 0, -8, 0)
v70 = src.trim(7438, 7584).crop(0, 0, -12, 0)
v71 = src.trim(7586, 7700).crop(0, 0, -18, 0)
v72 = src.trim(7701, 8042).crop(0, 0, -16, 0)
v73 = src.trim(8043, 8252).crop(0, 0, -10, 0)
v74 = src.trim(8255, 8372).crop(0, 0, -10, 0)
v75 = src.trim(8374, 8653).crop(0, 0, -12, 0)
v76 = src.trim(8659, 8838).crop(0, 0, -16, 0)
v77 = src.trim(8841, 9072).crop(0, 0, -16, 0)
v78 = src.trim(9074, 9080).crop(0, 0, -16, 0)
v79 = src.trim(9082, 9170).crop(0, 0, -16, 0)
v80 = src.trim(9173, 9291).crop(0, 0, -16, 0)
v81 = src.trim(9296, 9470).crop(0, 0, -16, 0)
v82 = src.trim(9472, 9679).crop(0, 0, -16, 0)
v83 = src.trim(9681, 9744).crop(0, 0, -12, 0)
v84 = src.trim(9745, 9771).crop(0, 0, -12, 0)
v85 = src.trim(9774, 9988).crop(0, 0, -18, 0)
v86 = src.trim(9990, 10194).crop(0, 0, -12, 0)
v87 = src.trim(10197, 10301).crop(0, 0, -8, 0)
v88 = src.trim(10304, 10474).crop(0, 0, -20, 0)
v89 = src.trim(10483, 10610).crop(0, 0, -8, 0)
v90 = src.trim(10627, 10702).crop(0, 0, -16, 0)
v91 = src.trim(10710, 10793).crop(0, 0, -8, 0)
v92 = src.trim(10797, 11029).crop(0, 0, -16, 0)
v93 = src.trim(11030, 11294).crop(0, 0, -16, 0)
v94 = src.trim(11297, 11387).crop(0, 0, -8, 0)
v95 = src.trim(11389, 11397).crop(0, 0, -8, 0)
v96 = src.trim(11399, 11655).crop(0, 0, -16, 0)
#v97 = src.trim(11656, 11855).crop(0, 0, -16, 0)
#return v96.autolevels(minRng=0, filterRadius=0, border_l=100)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

#******

# 65
/*
v65 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v65f.avi").ConvertToYV24()
v65 = v65.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
#v65 = v65.colorYUV(off_u=-4, off_v=-12)
v65 = v65.autolevels(filterRadius=9, gamma=1.2)
v65 = v65.convertToYV12
v65 = v65.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v65 = v65.removeDirt
v65 = v65.UnsharpMask(strength=300, radius=3, threshold=1)
v65 = v65.adjustBorders
return v65.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v66 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v66f.avi").ConvertToYV24()
v66 = v66.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v66 = v66.colorYUV(off_u=-4, off_v=-12)
v66 = v66.autolevels(filterRadius=9, gamma=1.5)
v66 = v66.convertToYV12
v66 = v66.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v66 = v66.removeDirt
v66 = v66.UnsharpMask(strength=300, radius=3, threshold=1)
v66 = v66.adjustBorders
return v66.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v67 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v67f.avi").ConvertToYV24()
v67 = v67.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v67 = v67.colorYUV(off_u=-4, off_v=-4)
v67 = v67.autolevels(minRng=0, filterRadius=9, gamma=1.5)
v67 = v67.convertToYV12
v67 = v67.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v67 = v67.removeDirt
v67 = v67.UnsharpMask(strength=200, radius=3, threshold=1)
v67 = v67.adjustBorders
return v67.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v68 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v68f.avi").ConvertToYV24()
v68 = v68.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v68 = v68.colorYUV(off_u=-6, off_v=-6)
v68 = v68.autolevels(filterRadius=9, gamma=1.5)
v68 = v68.convertToYV12
v68 = v68.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v68 = v68.removeDirt
v68 = v68.UnsharpMask(strength=200, radius=3, threshold=1)
v68 = v68.adjustBorders
return v68.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v69 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v69f.avi").ConvertToYV24()
v69 = v69.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v69 = v69.colorYUV(off_u=-6, off_v=0)
v69 = v69.autolevels(filterRadius=9, gamma=1.5)
v69 = v69.convertToYV12
v69 = v69.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v69 = v69.removeDirt
v69 = v69.UnsharpMask(strength=300, radius=3, threshold=1)
v69 = v69.adjustBorders
return v69.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v70 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v70f.avi").ConvertToYV24()
v70 = v70.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v70 = v70.colorYUV(off_u=-4, off_v=0)
v70 = v70.autolevels(filterRadius=9, gamma=1.5)
v70 = v70.convertToYV12
v70 = v70.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v70 = v70.removeDirt
v70 = v70.UnsharpMask(strength=300, radius=3, threshold=1)
v70 = v70.adjustBorders
return v70.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v71 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v71f.avi").ConvertToYV24()
v71 = v71.AdjustColor(ou=6, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v71 = v71.colorYUV(off_u=4, off_v=0)
v71 = v71.autolevels(filterRadius=9, gamma=1.2)
v71 = v71.convertToYV12
v71 = v71.Filter(th_SAD=900, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v71 = v71.removeDirt
v71 = v71.UnsharpMask(strength=300, radius=3, threshold=1)
v71 = v71.adjustBorders
return v71.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v72 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v72f.avi").ConvertToYV24()
v72 = v72.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v72 = v72.colorYUV(off_u=-8, off_v=-8)
v72 = v72.autolevels(filterRadius=9, gamma=1.3)
v72 = v72.convertToYV12
v72 = v72.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v72 = v72.removeDirt
v72 = v72.UnsharpMask(strength=300, radius=3, threshold=1)
v72 = v72.adjustBorders
return v72.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v73 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v73f.avi").ConvertToYV24()
v73 = v73.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.02, lock_chan=1, sat=1.9, gam_mac=true)
v73 = v73.colorYUV(off_u=-6, off_v=-4)
v73 = v73.autolevels(filterRadius=9, gamma=1.2, ignore_high=0)
v73 = v73.convertToYV12
v73 = v73.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v73 = v73.removeDirt
v73 = v73.UnsharpMask(strength=300, radius=3, threshold=1)
v73 = v73.adjustBorders
return v73.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v74 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v74f.avi").ConvertToYV24()
v74 = v74.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v74 = v74.colorYUV(off_u=-6, off_v=-4)
v74 = v74.autolevels(filterRadius=9, gamma=1.7, ignore_high=0)
v74 = v74.convertToYV12
v74 = v74.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v74 = v74.removeDirt
v74 = v74.UnsharpMask(strength=300, radius=3, threshold=1)
v74 = v74.adjustBorders
return v74.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v75 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v75f.avi").ConvertToYV24()
v75 = v75.AdjustColor(ou=6, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v75 = v75.colorYUV(off_u=-6, off_v=-6)
v75 = v75.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v75 = v75.convertToYV12
v75 = v75.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v75 = v75.removeDirt
v75 = v75.UnsharpMask(strength=300, radius=3, threshold=1)
v75 = v75.adjustBorders
return v75.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v76 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v76f.avi").ConvertToYV24()
v76 = v76.AdjustColor(ou=6, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.05, lock_chan=0, sat=1.9, gam_mac=true)
v76 = v76.colorYUV(off_u=-6, off_v=-6)
v76 = v76.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v76 = v76.convertToYV12
v76 = v76.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v76 = v76.removeDirt
v76 = v76.UnsharpMask(strength=300, radius=3, threshold=1)
v76 = v76.adjustBorders
return v76.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v77 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v77f.avi").ConvertToYV24()
v77 = v77.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v77 = v77.colorYUV(off_u=-6, off_v=-6)
v77 = v77.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v77 = v77.convertToYV12
v77 = v77.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v77 = v77.removeDirt
v77 = v77.UnsharpMask(strength=300, radius=3, threshold=1)
v77 = v77.adjustBorders
return v77.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v78 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v78f.avi").ConvertToYV24()
v78 = v78.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v78 = v78.colorYUV(off_u=-3, off_v=-3)
v78 = v78.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v78 = v78.convertToYV12
v78 = v78.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v78 = v78.removeDirt
v78 = v78.UnsharpMask(strength=300, radius=3, threshold=1)
v78 = v78.adjustBorders
return v78.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v79 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v79f.avi").ConvertToYV24()
v79 = v79.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v79 = v79.colorYUV(off_u=-5, off_v=-5)
v79 = v79.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v79 = v79.convertToYV12
v79 = v79.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v79 = v79.removeDirt
v79 = v79.UnsharpMask(strength=300, radius=3, threshold=1)
v79 = v79.adjustBorders
return v79.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v80 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v80f.avi").ConvertToYV24()
v80 = v80.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v80 = v80.colorYUV(off_u=-6, off_v=0)
v80 = v80.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v80 = v80.convertToYV12
v80 = v80.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v80 = v80.removeDirt
v80 = v80.UnsharpMask(strength=300, radius=3, threshold=1)
v80 = v80.adjustBorders
return v80.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v81 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v81f.avi").ConvertToYV24()
v81 = v81.AdjustColor(ou=2, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v81 = v81.colorYUV(off_u=-6, off_v=-3)
v81 = v81.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v81 = v81.convertToYV12
v81 = v81.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v81 = v81.removeDirt
v81 = v81.UnsharpMask(strength=300, radius=3, threshold=1)
v81 = v81.adjustBorders
return v81.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v82 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v82f.avi").ConvertToYV24()
v82 = v82.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v82 = v82.colorYUV(off_u=-3, off_v=-3)
v82 = v82.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v82 = v82.convertToYV12
v82 = v82.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v82 = v82.removeDirt
v82 = v82.UnsharpMask(strength=300, radius=3, threshold=1)
v82 = v82.adjustBorders
return v82.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v83 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v83f.avi").ConvertToYV24()
v83 = v83.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v83 = v83.colorYUV(off_u=-6, off_v=-3)
v83 = v83.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v83 = v83.convertToYV12
v83 = v83.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v83 = v83.removeDirt
v83 = v83.UnsharpMask(strength=300, radius=3, threshold=1)
v83 = v83.adjustBorders
return v83.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v84 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v84f.avi").ConvertToYV24()
v84 = v84.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v84 = v84.colorYUV(off_u=-6, off_v=-3)
v84 = v84.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v84 = v84.convertToYV12
v84 = v84.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v84 = v84.removeDirt
v84 = v84.UnsharpMask(strength=300, radius=3, threshold=1)
v84 = v84.adjustBorders
return v84.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v85 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v85f.avi").ConvertToYV24()
v85 = v85.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
#v85 = v85.colorYUV(off_u=-6, off_v=-3)
v85 = v85.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.0003)
v85 = v85.convertToYV12
v85 = v85.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v85 = v85.removeDirt
v85 = v85.UnsharpMask(strength=300, radius=3, threshold=1)
v85 = v85.adjustBorders
return v85.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v86 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v86f.avi").ConvertToYV24()
v86 = v86.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v86 = v86.colorYUV(off_u=-4, off_v=-2)
v86 = v86.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.0003)
v86 = v86.convertToYV12
v86 = v86.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v86 = v86.removeDirt
v86 = v86.UnsharpMask(strength=300, radius=3, threshold=1)
v86 = v86.adjustBorders
return v86.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v87 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v87f.avi").ConvertToYV24()
v87 = v87.AdjustColor(ou=2, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v87 = v87.colorYUV(off_u=-2, off_v=-2)
v87 = v87.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.0003)
v87 = v87.convertToYV12
v87 = v87.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v87 = v87.removeDirt
v87 = v87.UnsharpMask(strength=300, radius=3, threshold=1)
v87 = v87.adjustBorders
return v87.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v88 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v88f.avi").ConvertToYV24()
v88 = v88.AdjustColor(ou=2, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v88 = v88.colorYUV(off_u=-2, off_v=-2)
v88 = v88.autolevels(filterRadius=3, gamma=1.1, ignore_high=0.0003)
v88 = v88.convertToYV12
v88 = v88.Filter(th_SAD=1000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=7, sigma_c=0)
v88 = v88.removeDirt
v88 = v88.UnsharpMask(strength=300, radius=3, threshold=1)
v88 = v88.adjustBorders
return v88.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v89 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v89f.avi").ConvertToYV24()
v89 = v89.AdjustColor(ou=2, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v89 = v89.colorYUV(off_u=-4, off_v=-4)
v89 = v89.autolevels(filterRadius=3, gamma=1.2, ignore_high=0.0003)
v89 = v89.convertToYV12
v89 = v89.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v89 = v89.removeDirt
v89 = v89.UnsharpMask(strength=300, radius=3, threshold=1)
v89 = v89.adjustBorders
return v89.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v90 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v90f.avi").ConvertToYV24()
v90 = v90.AdjustColor(ou=4, ov=-8, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v90 = v90.colorYUV(off_u=-8, off_v=-4)
v90 = v90.autolevels(filterRadius=3, gamma=1, ignore_high=0.003)
v90 = v90.convertToYV12
v90 = v90.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v90 = v90.removeDirt
v90 = v90.UnsharpMask(strength=300, radius=3, threshold=1)
v90 = v90.adjustBorders
return v90.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v91 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v91f.avi").ConvertToYV24()
v91 = v91.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, gam_mac=true)
v91 = v91.colorYUV(off_u=-8, off_v=-4)
v91 = v91.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.003)
v91 = v91.convertToYV12
v91 = v91.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v91 = v91.removeDirt
v91 = v91.UnsharpMask(strength=300, radius=3, threshold=1)
v91 = v91.adjustBorders
return v91.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v92 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v92f.avi").ConvertToYV24()
br_w = 100
br_c = br_w - v92.width
br = v92.trim(69, 69).loop(v92.frameCount).crop(0, 0, br_c, 0)
v92 = v92.stackHorizontal(br)
v92 = v92.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v92 = v92.crop(0, 0, -br_w, 0)
v92 = v92.colorYUV(off_u=-4, off_v=-4)
v92 = v92.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.003)
v92 = v92.convertToYV12
v92 = v92.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v92 = v92.removeDirt
v92 = v92.UnsharpMask(strength=300, radius=3, threshold=1)
v92 = v92.adjustBorders
return v92.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v93 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v93f.avi").ConvertToYV24()
v93 = v93.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v93 = v93.colorYUV(off_u=-4, off_v=-4)
v93 = v93.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.003)
v93 = v93.convertToYV12
v93 = v93.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v93 = v93.removeDirt
v93 = v93.UnsharpMask(strength=300, radius=3, threshold=1)
v93 = v93.adjustBorders
return v93.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v94 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v94f.avi").ConvertToYV24()
v94 = v94.AdjustColor(ou=4, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v94 = v94.colorYUV(off_u=-4, off_v=-4)
v94 = v94.autolevels(filterRadius=3, gamma=1.1, ignore_high=0.003)
v94 = v94.convertToYV12
v94 = v94.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v94 = v94.removeDirt
v94 = v94.UnsharpMask(strength=300, radius=3, threshold=1)
v94 = v94.adjustBorders
return v94.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v95 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v95f.avi").ConvertToYV24()
v95 = v95.AdjustColor(ou=4, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v95 = v95.colorYUV(off_u=-4, off_v=-4)
v95 = v95.autolevels(filterRadius=3, gamma=1.1, ignore_high=0.003)
v95 = v95.convertToYV12
v95 = v95.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v95 = v95.removeDirt
v95 = v95.UnsharpMask(strength=300, radius=3, threshold=1)
v95 = v95.adjustBorders
return v95.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v96 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v96f.avi").ConvertToYV24()
v96 = v96.AdjustColor(ou=4, ov=-14, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1, gam_mac=true)
v96 = v96.colorYUV(off_u=-4, off_v=-4)
v96 = v96.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.003)
v96 = v96.convertToYV12
v96 = v96.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v96 = v96.removeDirt
v96 = v96.UnsharpMask(strength=300, radius=3, threshold=1)
v96 = v96.adjustBorders
return v96.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
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