import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v207 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v207f.avi").ConvertToYV24()
#207 v15 = v15.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v207 = v207.AdjustColor(ou=26, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v207 = v207.convertToYV12
v207 = v207.Filter(th_SAD=700, th_SADC=700, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v207 = v207.removeDirt
#v207 = v207.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v207 = v207.UnsharpMask(strength=300, radius=3, threshold=1)
#return v207.histogram("levels").prefetch(6)
return v207.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
