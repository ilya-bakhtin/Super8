import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v15 = v15.AdjustColor(2, 0, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v15 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v15f.avi").ConvertToYV24()
v15 = v15.AdjustColor(ou=2, ov=0, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v15 = v15.convertToYV12
v15 = v15.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v15 = v15.removeDirt
#v15 = v15.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v15 = v15.UnsharpMask(strength=300, radius=3, threshold=1)
#return v15.histogram("levels").prefetch(6)
v15 = v15.adjustBorders
return v15.assumefps(24).prefetch(6)
