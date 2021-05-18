import("..\11449 Bakhtin 02 N8.720p_09.mov.avs")
v201 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_193_216\pass2\v201f.avi").ConvertToYV24()
#201 v9 = v9.AdjustColor(16, -20, 0, 1.5, red_mul = 0.92).assumefps(16).AdjustFrameRate(preset_p = "slowest")
v201 = v201.AdjustColor(ou=20, ov=-26, x=300, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.9, blu = 1, gam_mac=true)
v201 = v201.convertToYV12
v201 = v201.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v201 = v201.removeDirt
#v201 = v201.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.2)
v201 = v201.UnsharpMask(strength=300, radius=3, threshold=1)
#return v201.histogram("levels").prefetch(6)
return v201.assumefps(16).AdjustFrameRate(preset_p = "slowest").prefetch(12)
