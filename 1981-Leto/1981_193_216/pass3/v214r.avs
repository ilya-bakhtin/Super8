import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v214 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v214f.avi").ConvertToYV24()
#214 v22 = v22.AdjustColor(12, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v214 = v214.AdjustColor(ou=16, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1.01, gam_mac=true)
v214 = v214.convertToYV12
v214 = v214.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v214 = v214.removeDirt
#v214 = v214.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v214 = v214.UnsharpMask(strength=300, radius=3, threshold=1)
#return v214.histogram("levels").prefetch(6)
return v214.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
