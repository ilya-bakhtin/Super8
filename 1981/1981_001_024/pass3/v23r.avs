import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v23 = v23.AdjustColor(-2, -4, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v23 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v23f.avi").ConvertToYV24()
v23 = v23.AdjustColor(ou=2, ov=-4, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v23 = v23.convertToYV12
v23 = v23.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v23 = v23.removeDirt
#v23 = v23.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v23 = v23.UnsharpMask(strength=300, radius=3, threshold=1)
#return v23.histogram("levels").prefetch(6)
v23 = v23.adjustBorders
return v23.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
