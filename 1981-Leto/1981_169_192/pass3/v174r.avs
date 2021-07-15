import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v174 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v174f.avi").ConvertToYV24()
#174 v6 = v6.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v174 = v174.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.9, gam_mac=true)
v174 = v174.convertToYV12
v174 = v174.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v174 = v174.removeDirt
v174 = v174.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v174 = v174.UnsharpMask(strength=300, radius=3, threshold=1)
#return v174.histogram("levels").prefetch(6)
return v174.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
