import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v196 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v196f.avi").ConvertToYV24()
#196 v4 = v4.AdjustColor(8, -4, 0, 2, red_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v196_0 = v196.AdjustColor(ou=10, ov=-6, x=10, lo_th=0.1, hi_th=0.2, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v196_1 = v196.AdjustColor(ou=10, ov=-6, x=10, lo_th=0.1, hi_th=0.05, sat=2.8, red = 0.96, blu = 1, gam_mac=true)
v196 = v196_0.trim(0, 161) + v196_1.trim(162, 189) + v196_0.trim(190, 0)
v196 = v196.convertToYV12
v196_0 = v196.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=0, sigma_c=0)
v196_1 = v196.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=false, sigma_y=0, sigma_c=0)
v196 = v196_0.trim(0, 161) + v196_1.trim(162, 189) + v196_0.trim(190, 0)
v196 = v196.removeDirt
#v196 = v196.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v196 = v196.UnsharpMask(strength=300, radius=3, threshold=1)
#return v196.histogram("levels").prefetch(6)
return v196.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
