import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v8 = v8.AdjustColor(10, -12, 0, 1.5, red_mul = 0.72, grn_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v224 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v224f.avi").ConvertToYV24()
v224 = v224.AdjustColor(ou=20, ov=-24, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.89, grn = 1, blu = 1, gam_mac=true)
v224 = v224.convertToYV12
v224 = v224.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v224 = v224.removeDirt
#v224 = v224.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v224 = v224.UnsharpMask(strength=300, radius=3, threshold=1)
#return v224.histogram("levels").prefetch(6)
v224 = v224.adjustBorders
return v224.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
