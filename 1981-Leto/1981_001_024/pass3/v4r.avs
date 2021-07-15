import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v4 = v4.AdjustColor(-2, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v04 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v4f.avi").ConvertToYV24()
v04 = v04.AdjustColor(ou=2, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v04 = v04.convertToYV12
v04 = v04.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v04 = v04.removeDirt
#v04 = v04.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v04 = v04.UnsharpMask(strength=300, radius=3, threshold=1)
#return v04.histogram("levels").prefetch(6)
v04 = v04.adjustBorders
return v04.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
