import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v21 = v21.AdjustColor(22, -12, -32, 1.5, red_mul = 0.96, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v237 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v237f.avi").ConvertToYV24()
v237 = v237.AdjustColor(ou=22, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=1.5, red = 0.96, grn = 1, blu = 0.94, gam_mac=true)
v237 = v237.convertToYV12
#v237 = v237.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=false, sigma_y=0, sigma_c=0)
v237 = v237.removeDirt
v237 = v237.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=0.9)
v237 = v237.UnsharpMask(strength=300, radius=3, threshold=1)
#return v237.histogram("levels").prefetch(6)
return v237.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)
