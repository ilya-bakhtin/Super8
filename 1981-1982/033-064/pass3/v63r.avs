import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
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
