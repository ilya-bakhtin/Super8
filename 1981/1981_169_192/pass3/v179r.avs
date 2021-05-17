import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v179 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v179f.avi").ConvertToYV24()
#179 v11 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v179 = v179.AdjustColor(ou=4, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, blu = 0.98, gam_mac=true)
v179 = v179.convertToYV12
v179_0 = v179.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v179_1 = v179.Filter(th_SAD=1000, th_SADC=1000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                     truemotion=true, sigma_y=0, sigma_c=0)
v179 = v179_0.trim(0, 150) + v179_1.trim(151, 0)
v179 = v179.removeDirt
v179 = v179.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v179 = v179.UnsharpMask(strength=300, radius=3, threshold=1)
#return v179.histogram("levels").prefetch(6)
return v179.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
