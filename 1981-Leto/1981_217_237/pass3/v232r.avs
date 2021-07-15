import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v16 = v16.AdjustColor(12, -10, 0, 1.5, blu_mul = 0.94).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v232 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v232f.avi").ConvertToYV24()
v232 = v232.AdjustColor(ou=12, ov=-10, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red = 1, grn = 1, blu = 0.94, gam_mac=true)
v232 = v232.convertToYV12
v232 = v232.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v232 = v232.removeDirt
#v232 = v232.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v232 = v232.UnsharpMask(strength=300, radius=3, threshold=1)
#return v232.histogram("levels").prefetch(6)
return v232.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)
