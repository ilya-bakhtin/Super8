import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v185 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v185f.avi").ConvertToYV24()
#185 v17 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v185 = v185.AdjustColor(ou=6, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2.5, red = 0.98, blu = 1, gam_mac=true)
v185 = v185.convertToYV12
v185 = v185.Filter(th_SAD=180, th_SADC=180, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v185 = v185.removeDirt
v185 = v185.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v185 = v185.UnsharpMask(strength=300, radius=3, threshold=1)
#return v185.histogram("levels").prefetch(6)
return v185.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
