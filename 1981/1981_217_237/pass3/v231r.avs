import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v15 = v15.AdjustColor(16, -12, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v231 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v231f.avi").ConvertToYV24()
v231 = v231.AdjustColor(ou=16, ov=-12, x=50, y=10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.7, red = 0.96, grn = 1, blu = 1, gam_mac=true)
v231 = v231.convertToYV12
v231 = v231.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v231 = v231.removeDirt
#v231 = v231.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v231 = v231.UnsharpMask(strength=300, radius=3, threshold=1)
#return v231.histogram("levels").prefetch(6)
return v231.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)
