import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
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
