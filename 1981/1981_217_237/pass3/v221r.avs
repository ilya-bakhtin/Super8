import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v5 = v5.AdjustColor(8, -12, 0, 1.5, red_mul = 0.92).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v221 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v221f.avi").ConvertToYV24()
v221 = v221.AdjustColor(ou=8, ov=-12, x=10, y=10, w=-50, h=-100, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 0.92, blu = 1, gam_mac=true)
v221 = v221.convertToYV12
v221 = v221.Filter(th_SAD=900, th_SADC=900, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v221 = v221.removeDirt
v221 = v221.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v221 = v221.UnsharpMask(strength=300, radius=3, threshold=1)
#return v221.histogram("levels").prefetch(6)
v221 = v221.adjustBorders
return v221.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
