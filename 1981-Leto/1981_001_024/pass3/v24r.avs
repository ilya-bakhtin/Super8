import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v24 = v24.AdjustColor(2, -6, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v24 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v24f.avi").ConvertToYV24()
v24 = v24.AdjustColor(ou=2, ov=-6, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v24 = v24.convertToYV12
v24 = v24.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v24 = v24.removeDirt
#v24 = v24.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v24 = v24.UnsharpMask(strength=300, radius=3, threshold=1)
#return v24.histogram("levels").prefetch(6)
v24 = v24.adjustBorders
return v24.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
