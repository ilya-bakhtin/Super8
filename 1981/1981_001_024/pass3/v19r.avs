import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v19 = v19.AdjustColor(0, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v19 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v19f.avi").ConvertToYV24()
v19 = v19.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v19 = v19.convertToYV12
v19 = v19.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v19 = v19.removeDirt
#v19 = v19.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v19 = v19.UnsharpMask(strength=300, radius=3, threshold=1)
#return v19.histogram("levels").prefetch(6)
v19 = v19.adjustBorders
return v19.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
