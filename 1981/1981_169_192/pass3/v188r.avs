import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v188 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v188f.avi").ConvertToYV24()
#188 v20 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v188 = v188.AdjustColor(ou=12, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=3, red = 0.96, blu = 1.02, gam_mac=true)
v188 = v188.convertToYV12
v188 = v188.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v188 = v188.removeDirt
v188 = v188.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.5)
v188 = v188.UnsharpMask(strength=300, radius=5, threshold=1)
#return v188.histogram("levels").prefetch(6)
return v188.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
