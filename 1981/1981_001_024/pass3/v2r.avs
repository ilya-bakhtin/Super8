import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v2 = v2.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v02 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v2f.avi").ConvertToYV24()
v02 = v02.AdjustColor(ou=0, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v02 = v02.convertToYV12
v02 = v02.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v02 = v02.removeDirt
#v02 = v02.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v02 = v02.UnsharpMask(strength=300, radius=3, threshold=1)
#return v02.histogram("levels").prefetch(6)
v02 = v02.adjustBorders
return v02.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
