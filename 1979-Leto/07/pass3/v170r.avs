import("..\11449 Bakhtin 01 S8.720p_07.mov.avs")
v04 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1979-Leto\07\pass2\v04f.avi").ConvertToYV24()
v04 = v04.AdjustColor(ou=4, ov=-6, lo_th=0.2, hi_th=0.2, sat=2, red = 0.98, blu=1, gam_mac=true)
#v4 = v4.AdjustColor(4, -6, 0, 1.8, red_mul = 0.98, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v04 = v04.convertToYV12
#v04 = v04.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=true, sigma_y=3, sigma_c=0)
v04 = v04.removeDirt
v04 = v04.autolevels(filterRadius=0, gamma=1.2)
v04 = v04.UnsharpMask(strength=300, radius=3, threshold=1)
#return v04.histogram("levels").prefetch(6)
v04 = v04.addBorders(0, 4, 0, 4)
return v04.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
