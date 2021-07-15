import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v9 = v9.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v225 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v225f.avi").ConvertToYV24()
v225 = v225.AdjustColor(ou=16, ov=-18, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.89, grn = 1, blu = 1, gam_mac=true)
v225 = v225.convertToYV12
v225 = v225.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v225 = v225.removeDirt
#v225 = v225.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v225 = v225.UnsharpMask(strength=300, radius=3, threshold=1)
#return v225.histogram("levels").prefetch(6)
v225 = v225.adjustBorders
return v225.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
