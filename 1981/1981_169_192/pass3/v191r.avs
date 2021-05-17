import("..\11449 Bakhtin 02 N8.720p_08.mov.avs")
v191 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_169_192\pass2\v191f.avi").ConvertToYV24()
#191 v23 = v16.AdjustColor(6, -6, 0, 2, red_mul = 0.98).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v191 = v191.AdjustColor(ou=12, ov=-6, x=200, lo_th=0.1, hi_th=0.1, sat=2, red = 0.97, blu = 1.01, gam_mac=true)
v191 = v191.convertToYV12
v191 = v191.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=0, sigma_c=0)
v191 = v191.removeDirt
v191 = v191.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v191 = v191.UnsharpMask(strength=300, radius=5, threshold=1)
#return v191.histogram("levels").prefetch(6)
return v191.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
