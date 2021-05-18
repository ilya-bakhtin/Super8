import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v197 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v197f.avi").ConvertToYV24()
#197 v5 = v5.AdjustColor(4, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v197 = v197.AdjustColor(ou=8, ov=-8, x=300, lo_th=0.1, hi_th=0.2, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v197 = v197.convertToYV12
v197 = v197.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v197 = v197.removeDirt
#v197 = v197.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v197 = v197.UnsharpMask(strength=300, radius=3, threshold=1)
#return v197.histogram("levels").prefetch(6)
return v197.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
