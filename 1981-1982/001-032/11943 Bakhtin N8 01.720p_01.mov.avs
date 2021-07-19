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

crop(146,0,-190,-0)

# 4, 285, 295, 355, 440, 469, 509, 584, 634, 734, 814, 833, 886, 931, 979, 1020, 1126, 1176, 1193, 1340, 1482, 1570, 1615, 1697,
# 1739, 1790, 1876, 1913, 1991, 2157, 2222, 2290, 2330, 2365, 2457, 2497, 2569, 2623, 2686, 2757, 2814, 2895, 2969, 3030, 3078,

global src = last
#return last

v1 = src.trim(4, 17) + src.trim(20, 284)
v2 = src.trim(285, 293)
v3 = src.trim(296, 354)
v4 = src.trim(355, 439)
v5 = src.trim(440, 468)
v6 = src.trim(469, 508)
v7 = src.trim(510, 583)
v8 = src.trim(584, 633)
v9 = src.trim(635, 733)
v10 = src.trim(734, 812)
v11 = src.trim(815, 832)
v12 = src.trim(834, 885)
v13 = src.trim(887, 929)
v14 = src.trim(931, 978)
v15 = src.trim(980, 1019)
v16 = src.trim(1020, 1125)
v17 = src.trim(1127, 1175)
v18 = src.trim(1176, 1192)
v19 = src.trim(1193, 1339)
v20 = src.trim(1340, 1481)
v21 = src.trim(1482, 1569)
v22 = src.trim(1571, 1614)
v23 = src.trim(1616, 1696)
v24 = src.trim(1697, 1737)
v25 = src.trim(1739, 1788)
v26 = src.trim(1790, 1875)
v27 = src.trim(1876, 1912)
v28 = src.trim(1914, 1990)
v29 = src.trim(1993, 2090)
v30 = src.trim(2157, 2221)
v31 = src.trim(2223, 2287)
v32 = src.trim(2290, 2328)

#return v1+v2+v3+v4+v5+v6+v7+v8+v9+v10+v11+v12+v13+v14+v15+v16+v17+v18+v19+v20+v21#+v22+v23+v24+v25+v26+v27+v28+v29+v30

global filter16 = true

#******

# 1
/*
v01 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v1f.avi").ConvertToYV24()
v01 = v01.AdjustColor(ou=9, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v01 = v01.colorYUV(off_u=-4)# autowhite=true, autogain=true)
v01 = v01.convertToYV12
v01 = v01.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v01 = v01.removeDirt
v01 = v01.UnsharpMask(strength=300, radius=3, threshold=1)
v01 = v01.adjustBorders
return v01.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v02 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v2f.avi").ConvertToYV24()
v02 = v02.AdjustColor(ou=39, ov=-39, x=300, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
#v02 = v02.colorYUV(off_u=-6)# autowhite=true, autogain=true)
v02 = v02.convertToYV12
v02 = v02.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v02 = v02.removeDirt
v02 = v02.UnsharpMask(strength=300, radius=3, threshold=1)
v02 = v02.adjustBorders
return v02.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v03 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v3f.avi").ConvertToYV24()
v03 = v03.AdjustColor(ou=5, ov=-5, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
#v03 = v03.colorYUV(off_u=-6)# autowhite=true, autogain=true)
v03 = v03.convertToYV12
v03 = v03.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v03 = v03.removeDirt
v03 = v03.UnsharpMask(strength=300, radius=3, threshold=1)
v03 = v03.adjustBorders
return v03.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v04 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v4f.avi").ConvertToYV24()
v04 = v04.AdjustColor(ou=5, ov=-5, x=100, y=10, h=-50, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v04 = v04.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v04 = v04.convertToYV12
v04 = v04.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v04 = v04.removeDirt
v04 = v04.UnsharpMask(strength=300, radius=3, threshold=1)
v04 = v04.adjustBorders
return v04.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v05 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v5f.avi").ConvertToYV24()
v05 = v05.AdjustColor(ou=5, ov=-5, x=100, y=10, h=-50, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v05 = v05.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v05 = v05.convertToYV12
v05 = v05.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v05 = v05.removeDirt
v05 = v05.UnsharpMask(strength=300, radius=3, threshold=1)
v05 = v05.adjustBorders
return v05.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v06 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v6f.avi").ConvertToYV24()
v06 = v06.AdjustColor(ou=5, ov=-5, x=10, y=10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v06 = v06.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v06 = v06.convertToYV12
v06 = v06.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v06 = v06.removeDirt
v06 = v06.UnsharpMask(strength=300, radius=3, threshold=1)
v06 = v06.adjustBorders
return v06.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v07 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v7f.avi").ConvertToYV24()
v07 = v07.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-100, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v07 = v07.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v07 = v07.convertToYV12
v07 = v07.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v07 = v07.removeDirt
v07 = v07.UnsharpMask(strength=300, radius=3, threshold=1)
v07 = v07.adjustBorders
return v07.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v08 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v8f.avi").ConvertToYV24()
v08 = v08.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-100, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v08 = v08.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v08 = v08.convertToYV12
v08 = v08.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v08 = v08.removeDirt
v08 = v08.UnsharpMask(strength=300, radius=3, threshold=1)
v08 = v08.adjustBorders
return v08.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v09 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v9f.avi").ConvertToYV24()
v09 = v09.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-10, h=-10, lo_th=0.3, hi_th=0.4, lock_chan=1, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v09 = v09.colorYUV(off_u=-8, off_v=0)# autowhite=true, autogain=true)
v09 = v09.autolevels(filterRadius=9)
v09 = v09.convertToYV12
#v09 = v09.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v09 = v09.removeDirt
v09 = v09.UnsharpMask(strength=100, radius=3, threshold=1)
v09 = v09.adjustBorders
return v09.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v10 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v10f.avi").ConvertToYV24()
v10 = v10.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v10 = v10.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
#v10 = v10.autolevels(filterRadius=9)
v10 = v10.convertToYV12
v10 = v10.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v10 = v10.removeDirt
v10 = v10.UnsharpMask(strength=300, radius=3, threshold=1)
v10 = v10.adjustBorders
return v10.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v11 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v11f.avi").ConvertToYV24()
v11 = v11.AdjustColor(ou=15, ov=-17, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v11 = v11.colorYUV(off_u=-10, off_v=6)# autowhite=true, autogain=true)
#v11 = v11.autolevels(filterRadius=9)
v11 = v11.convertToYV12
v11 = v11.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v11 = v11.removeDirt
v11 = v11.UnsharpMask(strength=300, radius=3, threshold=1)
v11 = v11.adjustBorders
return v11.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v12 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v12f.avi").ConvertToYV24()
v12 = v12.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v12 = v12.colorYUV(off_u=4, off_v=-4)# autowhite=true, autogain=true)
#v12 = v12.autolevels(filterRadius=9)
v12 = v12.convertToYV12
v12 = v12.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v12 = v12.removeDirt
v12 = v12.UnsharpMask(strength=300, radius=3, threshold=1)
v12 = v12.adjustBorders
return v12.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v13 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v13f.avi").ConvertToYV24()
v13 = v13.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v13 = v13.colorYUV(off_u=4, off_v=-4)# autowhite=true, autogain=true)
#v13 = v13.autolevels(filterRadius=9)
v13 = v13.convertToYV12
v13 = v13.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v13 = v13.removeDirt
v13 = v13.UnsharpMask(strength=300, radius=3, threshold=1)
v13 = v13.adjustBorders
return v13.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v14 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v14f.avi").ConvertToYV24()
v14 = v14.AdjustColor(ou=3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v14 = v14.colorYUV(off_u=4, off_v=-4)# autowhite=true, autogain=true)
#v14 = v14.autolevels(filterRadius=9)
v14 = v14.convertToYV12
v14 = v14.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v14 = v14.removeDirt
v14 = v14.UnsharpMask(strength=300, radius=3, threshold=1)
v14 = v14.adjustBorders
return v14.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v15 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v15f.avi").ConvertToYV24()
v15 = v15.AdjustColor(ou=3, ov=-3, x=10, y=10, w=-50, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v15 = v15.colorYUV(off_u=2, off_v=-2)# autowhite=true, autogain=true)
#v15 = v15.autolevels(filterRadius=9)
v15 = v15.convertToYV12
v15 = v15.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v15 = v15.removeDirt
v15 = v15.UnsharpMask(strength=300, radius=3, threshold=1)
v15 = v15.adjustBorders
return v15.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v16 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v16f.avi").ConvertToYV24()
v16_1 = v16.trim(0, 66)
v16_2 = v16.trim(67, 0)
br_w = 80
br_c = br_w - v16_2.width
br = v16_1.trim(66, 66).loop(v16_2.frameCount).crop(0, 0, br_c, 0)
v16_2 = v16_2.stackHorizontal(br)
v16_1 = v16_1.AdjustColor(ou=3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v16_2 = v16_2.AdjustColor(ou=3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v16 = v16_1 + v16_2.crop(0, 0, -br_w, 0)
v16 = v16.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v16 = v16.autolevels(filterRadius=9)
v16 = v16.convertToYV12
v16 = v16.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v16 = v16.removeDirt
v16 = v16.UnsharpMask(strength=300, radius=3, threshold=1)
v16 = v16.adjustBorders
return v16.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v17 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v17f.avi").ConvertToYV24()
v17 = v17.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
#v17 = v17.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
#v17 = v17.autolevels(filterRadius=9)
v17 = v17.convertToYV12
v17 = v17.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v17 = v17.removeDirt
v17 = v17.UnsharpMask(strength=300, radius=3, threshold=1)
v17 = v17.adjustBorders
return v17.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v18 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v18f.avi").ConvertToYV24()
v18 = v18.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v18 = v18.colorYUV(off_u=5, off_v=-5)# autowhite=true, autogain=true)
#v18 = v18.autolevels(filterRadius=9)
v18 = v18.convertToYV12
#v18 = v18.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v18 = v18.removeDirt
v18 = v18.UnsharpMask(strength=300, radius=3, threshold=1)
v18 = v18.adjustBorders
return v18.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v19 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v19f.avi").ConvertToYV24()
v19 = v19.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v19 = v19.colorYUV(off_u=5, off_v=-5)# autowhite=true, autogain=true)
#v19 = v19.autolevels(filterRadius=9)
v19 = v19.convertToYV12
v19 = v19.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v19 = v19.removeDirt
v19 = v19.UnsharpMask(strength=300, radius=3, threshold=1)
v19 = v19.adjustBorders
return v19.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v20 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v20f.avi").ConvertToYV24()
v20 = v20.AdjustColor(ou=0, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v20 = v20.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
#v20 = v20.autolevels(filterRadius=9)
v20 = v20.convertToYV12
v20 = v20.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v20 = v20.removeDirt
v20 = v20.UnsharpMask(strength=300, radius=3, threshold=1)
v20 = v20.adjustBorders
return v20.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v21 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v21f.avi").ConvertToYV24()
v21 = v21.AdjustColor(ou=-3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v21 = v21.colorYUV(off_u=5, off_v=-5)# autowhite=true, autogain=true)
v21 = v21.autolevels(filterRadius=9)
v21 = v21.convertToYV12
v21 = v21.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v21 = v21.removeDirt
v21 = v21.UnsharpMask(strength=300, radius=3, threshold=1)
v21 = v21.adjustBorders
return v21.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v22 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v22f.avi").ConvertToYV24()
v22 = v22.AdjustColor(ou=-1, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v22 = v22.colorYUV(off_u=5, off_v=-5)# autowhite=true, autogain=true)
v22 = v22.autolevels(filterRadius=9)
v22 = v22.convertToYV12
v22 = v22.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v22 = v22.removeDirt
v22 = v22.UnsharpMask(strength=200, radius=3, threshold=1)
v22 = v22.adjustBorders
return v22.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v23 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v23f.avi").ConvertToYV24()
v23 = v23.AdjustColor(ou=-1, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v23 = v23.colorYUV(off_u=5, off_v=-5)
#v23 = v23.autolevels(filterRadius=9)
v23 = v23.convertToYV12
#v23 = v23.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v23 = v23.removeDirt
v23 = v23.UnsharpMask(strength=200, radius=3, threshold=1)
v23 = v23.adjustBorders
return v23.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v24 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v24f.avi").ConvertToYV24()
v24 = v24.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v24 = v24.colorYUV(off_u=-2, off_v=-2)
#v24 = v24.autolevels(filterRadius=9)
v24 = v24.convertToYV12
v24 = v24.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v24 = v24.removeDirt
v24 = v24.UnsharpMask(strength=300, radius=3, threshold=1)
v24 = v24.adjustBorders
return v24.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v25 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v25f.avi").ConvertToYV24()
v25 = v25.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.5, lock_chan=1, sat=1.9, gam_mac=true)
v25 = v25.colorYUV(off_u=-5, off_v=-5)
#v25 = v25.autolevels(filterRadius=9)
v25 = v25.convertToYV12
v25 = v25.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v25 = v25.removeDirt
v25 = v25.UnsharpMask(strength=300, radius=3, threshold=1)
v25 = v25.adjustBorders
return v25.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v26 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v26f.avi").ConvertToYV24()
v26 = v26.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v26 = v26.colorYUV(off_u=-5, off_v=-5)
#v26 = v26.autolevels(filterRadius=9)
v26 = v26.convertToYV12
#v26 = v26.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v26 = v26.removeDirt
v26 = v26.UnsharpMask(strength=300, radius=3, threshold=1)
v26 = v26.adjustBorders
return v26.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v27 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v27f.avi").ConvertToYV24()
v27 = v27.AdjustColor(ou=0, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v27 = v27.colorYUV(off_u=2, off_v=-2)
#v27 = v27.autolevels(filterRadius=9)
v27 = v27.convertToYV12
v27 = v27.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v27 = v27.removeDirt
v27 = v27.UnsharpMask(strength=300, radius=3, threshold=1)
v27 = v27.adjustBorders
return v27.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v28 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v28f.avi").ConvertToYV24()
v28 = v28.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v28 = v28.colorYUV(off_u=2, off_v=-2)
#v28 = v28.autolevels(filterRadius=9)
v28 = v28.convertToYV12
v28 = v28.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v28 = v28.removeDirt
v28 = v28.UnsharpMask(strength=300, radius=3, threshold=1)
v28 = v28.adjustBorders
return v28.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v29 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v29f.avi").ConvertToYV24()
v29 = v29.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v29 = v29.colorYUV(off_u=2, off_v=-2)
#v29 = v29.autolevels(filterRadius=9)
v29 = v29.convertToYV12
v29 = v29.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v29 = v29.removeDirt
v29 = v29.UnsharpMask(strength=300, radius=3, threshold=1)
v29 = v29.adjustBorders
return v29.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v30 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v30f.avi").ConvertToYV24()
v30 = v30.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.5, lock_chan=2, sat=1.9, gam_mac=true)
v30 = v30.colorYUV(off_u=7, off_v=-5)
#v30 = v30.autolevels(filterRadius=9)
v30 = v30.convertToYV12
v30 = v30.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v30 = v30.removeDirt
v30 = v30.UnsharpMask(strength=300, radius=3, threshold=1)
v30 = v30.adjustBorders
return v30.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v31 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v31f.avi").ConvertToYV24()
v31 = v31.AdjustColor(ou=0, ov=-4, x=50, y=10, w=-10, h=-10, lo_th=0.2, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v31 = v31.colorYUV(off_u=9, off_v=-9)
#v31 = v31.autolevels(filterRadius=9)
v31 = v31.convertToYV12
v31 = v31.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v31 = v31.removeDirt
v31 = v31.UnsharpMask(strength=300, radius=3, threshold=1)
v31 = v31.adjustBorders
return v31.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)

v32 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v32f.avi").ConvertToYV24()
v32 = v32.AdjustColor(ou=3, ov=-7, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
v32 = v32.colorYUV(off_u=3, off_v=-3)
#v32 = v32.autolevels(filterRadius=9)
v32 = v32.convertToYV12
v32 = v32.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v32 = v32.removeDirt
v32 = v32.UnsharpMask(strength=300, radius=3, threshold=1)
v32 = v32.adjustBorders
return v32.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
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