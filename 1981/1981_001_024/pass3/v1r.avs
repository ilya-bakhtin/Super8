import("..\11449 Bakhtin 02 N8.720p_00.mov.avs")
#v1 = v1.AdjustColor(0, -2, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v01 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_001_024\pass2\v1f.avi").ConvertToYV24()
v01 = v01.AdjustColor(ou=0, ov=-2, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v01 = v01.convertToYV12
v01 = v01.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v01 = v01.removeDirt
#v01 = v01.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v01 = v01.UnsharpMask(strength=300, radius=3, threshold=1)
#return v01.histogram("levels").prefetch(6)
v01 = v01.adjustBorders
return v01.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
