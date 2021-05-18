import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v7 = v7.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v223 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v223f.avi").ConvertToYV24()
v223 = v223.AdjustColor(ou=10, ov=-12, x=10, y=100, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v223 = v223.convertToYV12
v223 = v223.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v223 = v223.removeDirt
v223 = v223.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v223 = v223.UnsharpMask(strength=300, radius=3, threshold=1)
#return v223.histogram("levels").prefetch(6)
v223 = v223.adjustBorders
return v223.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
