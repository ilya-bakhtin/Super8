import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v182 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v182f.avi").ConvertToYV24()
#182 v14 = v10.AdjustColor(4, -4, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v182 = v182.AdjustColor(ou=8, ov=-6, lo_th=0.1, hi_th=0.1, sat=3, red = 0.98, blu = 1, gam_mac=true)
v182 = v182.convertToYV12
v182 = v182.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v182 = v182.removeDirt
v182 = v182.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.5)
v182 = v182.UnsharpMask(strength=300, radius=3, threshold=1)
#return v182.histogram("levels").prefetch(6)
return v182.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
