import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v20 = v20.AdjustColor(16, -8, 0, 1.5, red_mul = 0.94).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v236 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v236f.avi").ConvertToYV24()
v236 = v236.AdjustColor(ou=16, ov=-8, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.94, grn = 1, blu = 1, gam_mac=true)
v236 = v236.convertToYV12
v236 = v236.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v236 = v236.removeDirt
#v236 = v236.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v236 = v236.UnsharpMask(strength=300, radius=3, threshold=1)
#return v236.histogram("levels").prefetch(6)
return v236.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
