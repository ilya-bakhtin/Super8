import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v6 = v6.AdjustColor(12, -16, 0, 1.5).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v222 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v222f.avi").ConvertToYV24()
v222 = v222.AdjustColor(ou=12, ov=-16, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 1, blu = 1, gam_mac=true)
v222 = v222.convertToYV12
v222 = v222.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v222 = v222.removeDirt
#v222 = v222.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1)
v222 = v222.UnsharpMask(strength=300, radius=3, threshold=1)
#return v222.histogram("levels").prefetch(6)
v222 = v222.adjustBorders
return v222.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
