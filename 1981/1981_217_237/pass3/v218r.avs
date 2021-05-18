import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v2 = v2.AdjustColor(10, -10, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v218 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v218f.avi").ConvertToYV24()
v218 = v218.AdjustColor(ou=12, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v218 = v218.convertToYV12
v218 = v218.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v218 = v218.removeDirt
v218 = v218.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v218 = v218.UnsharpMask(strength=300, radius=3, threshold=1)
#return v218.histogram("levels").prefetch(6)
v218 = v218.adjustBorders
return v218.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
