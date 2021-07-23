import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
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
