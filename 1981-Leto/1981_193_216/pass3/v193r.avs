import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v193 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v193f.avi").ConvertToYV24()
#193 v1 = v1.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v193 = v193.AdjustColor(ou=8, ov=-4, x=10, lo_th=0.1, hi_th=0.1, sat=2, red = 0.96, blu = 1, gam_mac=true)
v193 = v193.convertToYV12
v193 = v193.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v193 = v193.removeDirt
v193 = v193.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.1)
v193 = v193.UnsharpMask(strength=300, radius=5, threshold=1)
#return v193.histogram("levels").prefetch(6)
return v193.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
