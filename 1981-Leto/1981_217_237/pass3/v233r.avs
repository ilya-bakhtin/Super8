import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v17 = v17.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v233 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v233f.avi").ConvertToYV24()
v233 = v233.AdjustColor(ou=12, ov=-10, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.94, grn = 1, blu = 0.94, gam_mac=true)
v233 = v233.convertToYV12
#v233 = v233.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                   truemotion=false, sigma_y=0, sigma_c=0)
v233 = v233.removeDirt
#v233 = v233.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v233 = v233.UnsharpMask(strength=300, radius=3, threshold=1)
#return v233.histogram("levels").prefetch(6)
return v233.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)
