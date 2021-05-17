import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v181 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v181f.avi").ConvertToYV24()
#181 v13 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v181 = v181.AdjustColor(ou=8, ov=-6, lo_th=0.2, hi_th=0.2, sat=3, red = 0.98, blu = 1, gam_mac=true)
v181 = v181.convertToYV12
v181 = v181.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v181 = v181.removeDirt
v181 = v181.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.5)
v181 = v181.UnsharpMask(strength=300, radius=3, threshold=1)
#return v181.histogram("levels").prefetch(6)
return v181.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
