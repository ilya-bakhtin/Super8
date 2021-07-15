import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v195 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v195f.avi").ConvertToYV24()
#195 v3 = v3.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v195 = v195.AdjustColor(ou=10, ov=-6, x=10, lo_th=0.1, hi_th=0.2, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v195 = v195.convertToYV12
v195 = v195.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v195 = v195.removeDirt
v195 = v195.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v195 = v195.UnsharpMask(strength=300, radius=3, threshold=1)
#return v195.histogram("levels").prefetch(6)
return v195.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
