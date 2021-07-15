import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v11 = v11.AdjustColor(-2, -6, 0, 1.5).assumefps(24) #.AdjustFrameRate(preset_p = "slowest")
v11 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v11f.avi").ConvertToYV24()
v11 = v11.AdjustColor(ou=-2, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v11 = v11.convertToYV12
v11 = v11.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v11 = v11.removeDirt
#v11 = v11.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v11 = v11.UnsharpMask(strength=300, radius=3, threshold=1)
#return v11.histogram("levels").prefetch(6)
v11 = v11.adjustBorders
return v11.assumefps(24).prefetch(6)
