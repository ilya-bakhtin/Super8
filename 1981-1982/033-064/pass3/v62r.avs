import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
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
