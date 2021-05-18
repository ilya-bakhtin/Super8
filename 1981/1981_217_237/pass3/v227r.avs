import("..\11449 Bakhtin 02 N8.720p_10.mov.avs")
#v11 = v11.AdjustColor(10, -12, 0, 1.5, red_mul = 0.92, grn_mul = 0.96).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v227 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981\1981_217_237\pass2\v227f.avi").ConvertToYV24()
v227 = v227.AdjustColor(ou=10, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.5, red = 0.92, grn = 0.96, blu = 1, gam_mac=true)
v227 = v227.convertToYV12
v227 = v227.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v227 = v227.removeDirt
v227 = v227.autolevels(ignore_low=0.0003, ignore_high=0.0003, border_l = 10, border_r = 10, filterRadius = 0, minRng=0, gamma=1.3)
v227 = v227.UnsharpMask(strength=300, radius=3, threshold=1)
#return v227.histogram("levels").prefetch(6)
v227 = v227.adjustBorders
return v227.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
