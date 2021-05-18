import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v206 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v206f.avi").ConvertToYV24()
#206 v14 = v14.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v206 = v206.AdjustColor(ou=26, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v206 = v206.convertToYV12
v206 = v206.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v206 = v206.removeDirt
#v206 = v206.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v206 = v206.UnsharpMask(strength=300, radius=3, threshold=1)
#return v206.histogram("levels").prefetch(6)
return v206.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
