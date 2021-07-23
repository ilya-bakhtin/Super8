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
# 7001,

global src = last
#return last.autolevels(minRng=0, filterRadius=0)

#v32 = src.trim(2290, 2328)
v33 = src.trim(2359, 2364).crop(0, 0, -16, 0)
v34 = src.trim(2366, 2456).crop(0, 0, -16, 0)
v35 = src.trim(2457, 2496).crop(0, 0, -16, 0)
v36 = src.trim(2497, 2568).crop(0, 0, -16, 0)
v37 = src.trim(2570, 2622).crop(0, 0, -18, 0)
v38 = src.trim(2623, 2685).crop(0, 0, -18, 0)
v39 = src.trim(2686, 2756).crop(0, 0, -16, 0)
#v40 = src.trim(2757, 2813).crop(0, 0, -16, 0)
v40 = src.trim(2814, 2894).crop(0, 0, -16, 0)
v41 = src.trim(2897, 2968).crop(0, 0, -16, 0)
v42 = src.trim(2969, 3029).crop(0, 0, -18, 0)
v43 = src.trim(3031, 3076).crop(0, 0, -16, 0)
v44 = src.trim(3078, 3157).crop(0, 0, -16, 0)
v45 = src.trim(3158, 3213).crop(0, 0, -18, 0)
v46 = src.trim(3214, 3238).crop(0, 0, -18, 0)
v47 = src.trim(3245, 3544).crop(0, 0, -16, 0)
v48 = src.trim(3545, 3638).crop(0, 0, -16, 0)
v49 = src.trim(3639, 3777).crop(0, 0, -16, 0)
v50 = src.trim(3778, 4184).crop(0, 0, -16, 0)
v51 = src.trim(4185, 4392).crop(0, 0, -16, 0)
v52 = src.trim(4396, 4551).crop(0, 0, -20, 0)
v53 = src.trim(4572, 4742).crop(0, 0, -4, 0)
v54 = src.trim(4743, 4874).crop(0, 0, -4, 0)
v55 = src.trim(4875, 5010).crop(0, 0, -4, 0)
v56 = src.trim(5013, 5139).crop(0, 0, -8, 0)
v57 = src.trim(5142, 5500).crop(0, 0, -16, 0)
v58 = src.trim(5501, 5675).crop(0, 0, -8, 0)
v59 = src.trim(5677, 5904).crop(0, 0, -4, 0)
v60 = src.trim(5907, 5969).crop(0, 0, -12, 0)
v61 = src.trim(5971, 6475).crop(0, 0, -8, 0)
v61 = v61.trim(0, 242) + v61.trim(247, 0)
v62 = src.trim(6478, 6738).crop(0, 0, -8, 0)
v63 = src.trim(6739, 6750).crop(0, 0, -4, 0)
v64 = src.trim(6753, 6858).crop(0, 0, -8, 0)
#return v64.autolevels(minRng=0, filterRadius=0)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

#******

# 33
/*
v33 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v33f.avi").ConvertToYV24()
v33 = v33.AdjustColor(ou=3, ov=-12, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
#v33 = v33.colorYUV(off_u=3, off_v=-3)
#v33 = v33.autolevels(filterRadius=9)
v33 = v33.convertToYV12
v33 = v33.Filter(th_SAD=500, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v33 = v33.removeDirt
v33 = v33.UnsharpMask(strength=300, radius=3, threshold=1)
v33 = v33.adjustBorders
return v33.assumefps(6).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v34 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v34f.avi").ConvertToYV24()
v34 = v34.AdjustColor(ou=3, ov=-7, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v34 = v34.colorYUV(off_u=-3, off_v=0)
v34 = v34.autolevels(filterRadius=9, gamma=1.3)
v34 = v34.convertToYV12
v34 = v34.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v34 = v34.removeDirt
v34 = v34.UnsharpMask(strength=200, radius=3, threshold=1)
v34 = v34.adjustBorders
return v34.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v35 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v35f.avi").ConvertToYV24()
v35 = v35.AdjustColor(ou=3, ov=-7, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v35 = v35.colorYUV(off_u=-6, off_v=0)
v35 = v35.autolevels(filterRadius=9, gamma=1.5)
v35 = v35.convertToYV12
v35 = v35.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v35 = v35.removeDirt
v35 = v35.UnsharpMask(strength=200, radius=3, threshold=1)
v35 = v35.adjustBorders
return v35.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v36 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v36f.avi").ConvertToYV24()
v36 = v36.AdjustColor(ou=3, ov=-7, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v36 = v36.colorYUV(off_u=-6, off_v=0)
v36 = v36.autolevels(filterRadius=9, gamma=1.5)
v36 = v36.convertToYV12
v36 = v36.Filter(th_SAD=300, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v36 = v36.removeDirt
v36 = v36.UnsharpMask(strength=200, radius=3, threshold=1)
v36 = v36.adjustBorders
return v36.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v37 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v37f.avi").ConvertToYV24()
v37 = v37.AdjustColor(ou=-5, ov=-5, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v37 = v37.colorYUV(off_u=6, off_v=0)
#v37 = v37.autolevels(filterRadius=9, gamma=1.5)
v37 = v37.convertToYV12
v37 = v37.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v37 = v37.removeDirt
v37 = v37.UnsharpMask(strength=300, radius=3, threshold=1)
v37 = v37.adjustBorders
return v37.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v38 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v38f.avi").ConvertToYV24()
v38 = v38.AdjustColor(ou=-5, ov=-5, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v38 = v38.colorYUV(off_u=-6, off_v=0)
#v38 = v38.autolevels(filterRadius=9, gamma=1.5)
v38 = v38.convertToYV12
v38 = v38.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v38 = v38.removeDirt
v38 = v38.UnsharpMask(strength=300, radius=3, threshold=1)
v38 = v38.adjustBorders
return v38.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v39 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v39f.avi").ConvertToYV24()
v39 = v39.AdjustColor(ou=-5, ov=-5, x=450, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v39 = v39.colorYUV(off_u=3, off_v=-3)
#v39 = v39.autolevels(filterRadius=9, gamma=1.5)
v39 = v39.convertToYV12
v39 = v39.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v39 = v39.removeDirt
v39 = v39.UnsharpMask(strength=300, radius=3, threshold=1)
v39 = v39.adjustBorders
return v39.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v40 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v40f.avi").ConvertToYV24()
v40 = v40.AdjustColor(ou=-5, ov=-5, x=450, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v40 = v40.colorYUV(off_u=3, off_v=-3)
#v40 = v40.autolevels(filterRadius=9, gamma=1.5)
v40 = v40.convertToYV12
v40 = v40.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v40 = v40.removeDirt
v40 = v40.UnsharpMask(strength=300, radius=3, threshold=1)
v40 = v40.adjustBorders
return v40.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v41 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v41f.avi").ConvertToYV24()
br_w = 100
br_c = v41.width - br_w
br = v41.trim(43, 43).loop(v41.frameCount).crop(br_c, 0, 0, 0)
v41 = v41.stackHorizontal(br)
v41 = v41.AdjustColor(ou=-5, ov=-5, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=1.9, gam_mac=true)
v41 = v41.crop(0, 0, -br_w, 0)
v41 = v41.colorYUV(off_u=4, off_v=-4)
#v41 = v41.autolevels(filterRadius=9, gamma=1.5)
v41 = v41.convertToYV12
v41 = v41.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v41 = v41.removeDirt
v41 = v41.UnsharpMask(strength=300, radius=3, threshold=1)
v41 = v41.adjustBorders
return v41.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v42 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v42f.avi").ConvertToYV24()
v42 = v42.AdjustColor(ou=-5, ov=-5, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=1.9, gam_mac=true)
v42 = v42.colorYUV(off_u=5, off_v=-5)
v42 = v42.autolevels(filterRadius=9, gamma=1.5)
v42 = v42.convertToYV12
v42 = v42.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v42 = v42.removeDirt
v42 = v42.UnsharpMask(strength=300, radius=3, threshold=1)
v42 = v42.adjustBorders
return v42.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v43 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v43f.avi").ConvertToYV24()
v43 = v43.AdjustColor(ou=-5, ov=-5, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.5, gam_mac=false)
#v43 = v43.colorYUV(off_u=5, off_v=-5)
v43 = v43.autolevels(filterRadius=9, gamma=1.5)
v43 = v43.convertToYV12
v43 = v43.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v43 = v43.removeDirt
v43 = v43.UnsharpMask(strength=300, radius=3, threshold=1)
v43 = v43.adjustBorders
return v43.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v44 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v44f.avi").ConvertToYV24()
v44 = v44.trim(1, 0)
v44 = v44.AdjustColor(ou=3, ov=-10, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
#v44 = v44.colorYUV(off_u=5, off_v=-5)
v44 = v44.autolevels(filterRadius=9, gamma=1.5)
v44 = v44.convertToYV12
v44 = v44.Filter(th_SAD=300, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v44 = v44.removeDirt
v44 = v44.UnsharpMask(strength=300, radius=3, threshold=1)
v44 = v44.adjustBorders
return v44.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v45 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v45f.avi").ConvertToYV24()
v45 = v45.AdjustColor(ou=3, ov=-10, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
v45 = v45.colorYUV(off_u=5, off_v=-5)
#v45 = v45.autolevels(filterRadius=9, gamma=1.5)
v45 = v45.convertToYV12
v45 = v45.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v45 = v45.removeDirt
v45 = v45.adjustBorders
v45 = v45.UnsharpMask(strength=300, radius=3, threshold=1)
return v45.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v46 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v46f.avi").ConvertToYV24()
v46 = v46.AdjustColor(ou=3, ov=-10, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
v46 = v46.colorYUV(off_u=5, off_v=-5)
v46 = v46.autolevels(filterRadius=9, gamma=1.5)
v46 = v46.convertToYV12
v46 = v46.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v46 = v46.removeDirt
v46 = v46.UnsharpMask(strength=300, radius=3, threshold=1)
v46 = v46.adjustBorders
return v46.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v47 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v47f.avi").ConvertToYV24()
br = v47.trim(85, 85).loop(v47.frameCount).crop(250, 0, 350 - v47.width, 0)
v47 = v47.stackHorizontal(br)
v47 = v47.AdjustColor(ou=3, ov=-10, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.5, gam_mac=true)
v47 = v47.crop(0, 0, -br.width, 0)
v47 = v47.colorYUV(off_u=-4, off_v=-4)
#v47 = v47.autolevels(filterRadius=9, gamma=1.5)
v47 = v47.convertToYV12
v47 = v47.Filter(th_SAD=200, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v47 = v47.removeDirt
v47 = v47.UnsharpMask(strength=200, radius=3, threshold=1)
v47 = v47.adjustBorders
return v47.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v48 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v48f.avi").ConvertToYV24()
v48 = v48.AdjustColor(ou=3, ov=-10, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v48 = v48.colorYUV(off_u=-4, off_v=-2)
#v48 = v48.autolevels(filterRadius=9, gamma=1.5)
v48 = v48.convertToYV12
v48 = v48.Filter(th_SAD=200, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v48 = v48.removeDirt
v48 = v48.UnsharpMask(strength=200, radius=3, threshold=1)
v48 = v48.adjustBorders
return v48.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v49 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v49f.avi").ConvertToYV24()
v49 = v49.AdjustColor(ou=3, ov=-10, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v49 = v49.colorYUV(off_u=-4, off_v=-2)
#v49 = v49.autolevels(filterRadius=9, gamma=1.5)
v49 = v49.convertToYV12
v49 = v49.Filter(th_SAD=200, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v49 = v49.removeDirt
v49 = v49.UnsharpMask(strength=300, radius=3, threshold=1)
v49 = v49.adjustBorders
return v49.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v50 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v50f.avi").ConvertToYV24()
v50 = v50.trim(1, 0)
v50 = v50.AdjustColor(ou=3, ov=-10, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
v50 = v50.colorYUV(off_u=-4, off_v=-2)
#v50 = v50.autolevels(filterRadius=9, gamma=1.5)
v50 = v50.convertToYV12
v50 = v50.Filter(th_SAD=200, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v50 = v50.removeDirt
v50 = v50.UnsharpMask(strength=300, radius=3, threshold=1)
v50 = v50.adjustBorders
return v50.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v51 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v51f.avi").ConvertToYV24()
v51 = v51.AdjustColor(ou=3, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v51 = v51.colorYUV(off_u=-4, off_v=-2)
#v51 = v51.autolevels(filterRadius=9, gamma=1.5)
v51 = v51.convertToYV12
v51 = v51.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v51 = v51.removeDirt
v51 = v51.UnsharpMask(strength=300, radius=3, threshold=1)
v51 = v51.adjustBorders
return v51.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v52 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v52f.avi").ConvertToYV24()
v52 = v52.AdjustColor(ou=3, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v52 = v52.colorYUV(off_u=-4, off_v=-2)
#v52 = v52.autolevels(filterRadius=9, gamma=1.5)
v52 = v52.convertToYV12
v52 = v52.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v52 = v52.removeDirt
v52 = v52.UnsharpMask(strength=300, radius=3, threshold=1)
v52 = v52.adjustBorders
return v52.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v53 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v53f.avi").ConvertToYV24()
v53 = v53.AdjustColor(ou=3, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v53 = v53.colorYUV(off_u=-4, off_v=-2)
#v53 = v53.autolevels(filterRadius=9, gamma=1.5)
v53 = v53.convertToYV12
#v53 = v53.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v53 = v53.removeDirt
v53 = v53.UnsharpMask(strength=200, radius=3, threshold=1)
v53 = v53.adjustBorders
return v53.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v54 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v54f.avi").ConvertToYV24()
v54 = v54.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v54 = v54.colorYUV(off_u=-4, off_v=-2)
#v54 = v54.autolevels(filterRadius=9, gamma=1.5)
v54 = v54.convertToYV12
#v54 = v54.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v54 = v54.removeDirt
v54 = v54.UnsharpMask(strength=300, radius=3, threshold=1)
v54 = v54.adjustBorders
return v54.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v55 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v55f.avi").ConvertToYV24()
v55 = v55.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v55 = v55.colorYUV(off_u=-4, off_v=-2)
#v55 = v55.autolevels(filterRadius=9, gamma=1.5)
v55 = v55.convertToYV12
v55 = v55.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v55 = v55.removeDirt
v55 = v55.UnsharpMask(strength=300, radius=3, threshold=1)
v55 = v55.adjustBorders
return v55.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v56 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v56f.avi").ConvertToYV24()
v56 = v56.AdjustColor(ou=0, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v56 = v56.colorYUV(off_u=5, off_v=-3)
#v56 = v56.autolevels(filterRadius=9, gamma=1.5)
v56 = v56.convertToYV12
v56 = v56.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v56 = v56.removeDirt
v56 = v56.UnsharpMask(strength=300, radius=3, threshold=1)
v56 = v56.adjustBorders
return v56.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v57 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v57f.avi").ConvertToYV24()
v57 = v57.AdjustColor(ou=0, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.2, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v57 = v57.colorYUV(off_u=-2, off_v=0)
#v57 = v57.autolevels(filterRadius=9, gamma=1.5)
v57 = v57.convertToYV12
v57 = v57.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v57 = v57.removeDirt
v57 = v57.UnsharpMask(strength=300, radius=3, threshold=1)
v57 = v57.adjustBorders
return v57.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v58 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v58f.avi").ConvertToYV24()
v58 = v58.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.2, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
#v58 = v58.colorYUV(off_u=-2, off_v=0)
#v58 = v58.autolevels(filterRadius=9, gamma=1.5)
v58 = v58.convertToYV12
v58 = v58.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v58 = v58.removeDirt
v58 = v58.UnsharpMask(strength=300, radius=3, threshold=1)
v58 = v58.adjustBorders
return v58.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v59 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v59f.avi").ConvertToYV24()
v59 = v59.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v59 = v59.colorYUV(off_u=-4, off_v=-2)
#v59 = v59.autolevels(filterRadius=9, gamma=1.5)
v59 = v59.convertToYV12
v59 = v59.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v59 = v59.removeDirt
v59 = v59.UnsharpMask(strength=300, radius=3, threshold=1)
v59 = v59.adjustBorders
return v59.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v60 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v60f.avi").ConvertToYV24()
v60 = v60.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v60 = v60.colorYUV(off_u=-2, off_v=-2)
#v60 = v60.autolevels(filterRadius=9, gamma=1.5)
v60 = v60.convertToYV12
v60 = v60.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v60 = v60.removeDirt
v60 = v60.UnsharpMask(strength=300, radius=3, threshold=1)
v60 = v60.adjustBorders
return v60.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v61 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v61f.avi").ConvertToYV24()
v61 = v61.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v61 = v61.colorYUV(off_u=-6, off_v=-4)
#v61 = v61.autolevels(filterRadius=9, gamma=1.5)
v61 = v61.convertToYV12
v61 = v61.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v61 = v61.removeDirt
v61 = v61.UnsharpMask(strength=300, radius=3, threshold=1)
v61 = v61.adjustBorders
return v61.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v62 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v62f.avi").ConvertToYV24()
v62 = v62.AdjustColor(ou=0, ov=0, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v62 = v62.colorYUV(off_u=-6, off_v=-4)
#v62 = v62.autolevels(filterRadius=9, gamma=1.5)
v62 = v62.convertToYV12
#v62 = v62.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v62 = v62.removeDirt
v62 = v62.UnsharpMask(strength=200, radius=3, threshold=1)
v62 = v62.adjustBorders
return v62.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v63 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v63f.avi").ConvertToYV24()
v63 = v63.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v63 = v63.colorYUV(off_u=-4, off_v=-12)
#v63 = v63.autolevels(filterRadius=9, gamma=1.5)
v63 = v63.convertToYV12
#v63 = v63.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v63 = v63.removeDirt
v63 = v63.UnsharpMask(strength=200, radius=3, threshold=1)
v63 = v63.adjustBorders
return v63.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v64 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v64f.avi").ConvertToYV24()
v64 = v64.AdjustColor(ou=6, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v64 = v64.colorYUV(off_u=-4, off_v=-12)
v64 = v64.autolevels(filterRadius=9, gamma=1.5)
v64 = v64.convertToYV12
v64 = v64.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v64 = v64.removeDirt
v64 = v64.UnsharpMask(strength=200, radius=3, threshold=1)
v64 = v64.adjustBorders
return v64.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
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