import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v177 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v177f.avi").ConvertToYV24()
#177 v9 = v9.AdjustColor(8, -4, 0, 1.5, blu_mul = 0.9).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v177 = v177.AdjustColor(ou=8, ov=-4, lo_th=0.1, hi_th=0.1, sat=1.5, blu = 0.9, gam_mac=true)
v177 = v177.convertToYV12
v177 = v177.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v177 = v177.removeDirt
v177 = v177.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v177 = v177.UnsharpMask(strength=300, radius=3, threshold=1)
#return v177.histogram("levels").prefetch(6)
return v177.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
