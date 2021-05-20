import("..\11449 Bakhtin 01 S8.720p_06.mov.avs")
v24 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1979-Leto\06\pass2\v24f.avi").ConvertToYV24()
v24 = v24.AdjustColor(ou=5, ov=-5, lo_th=0.2, hi_th=0.2, sat=1.6, red = 1, grn=1, blu=1, gam_mac=true)
#v24 = v24.AdjustColor(5, -5, 32, 1.6, red_mul = 1, grn_mul = 0.99, blu_mul = 1).assumefps(12).AdjustFrameRate(preset_p = "slowest")
v24 = v24.convertToYV12
v24 = v24.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v24 = v24.removeDirt
v24 = v24.autolevels(filterRadius=0, gamma=1.5)
v24 = v24.UnsharpMask(strength=300, radius=3, threshold=1)
#return v24.histogram("levels").prefetch(6)
v24 = v24.addBorders(0,6,0,6)
return v24.assumefps(12).AdjustFrameRate(preset_p = "slowest").prefetch(12)
