import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v210 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v210f.avi").ConvertToYV24()
#210 v18 = v18.AdjustColor(20, -24, 0, 1.5, red_mul = 0.92, blu_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v210 = v210.AdjustColor(ou=20, ov=-24, x=400, lo_th=0.2, hi_th=0.2, lock_chan=0, sat=1.9, red = 0.92, blu = 0.96, gam_mac=true)
v210 = v210.convertToYV12
v210 = v210.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v210 = v210.removeDirt
#v210 = v210.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v210 = v210.UnsharpMask(strength=300, radius=3, threshold=1)
#return v210.histogram("levels").prefetch(6)
return v210.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
