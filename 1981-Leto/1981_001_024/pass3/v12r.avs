import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v12 = v12.AdjustColor(0, -4, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v12 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v12f.avi").ConvertToYV24()
v12 = v12.AdjustColor(ou=0, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v12 = v12.convertToYV12
v12 = v12.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v12 = v12.removeDirt
#v12 = v12.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v12 = v12.UnsharpMask(strength=300, radius=3, threshold=1)
#return v12.histogram("levels").prefetch(6)
v12 = v12.adjustBorders
return v12.assumefps(24).prefetch(6)
