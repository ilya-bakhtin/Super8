import("..\11449 Bakhtin 01 S8.720p_07.mov.avs")
v03 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1979-Leto\07\pass2\v03f.avi").ConvertToYV24()
v03 = v03.AdjustColor(ou=0, ov=-4, lo_th=0.1, hi_th=0.1, sat=2, red = 0.8, blu=1.1, gam_mac=true)
#v3 = v3.AdjustColor(4, -6, 32, 2, red_mul = 0.8, grn_mul = 1, blu_mul = 1).assumefps(18).AdjustFrameRate(preset_p = "slowest")
v03 = v03.convertToYV12
v03 = v03.Filter(th_SAD=100, th_SADC=100, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=true, sigma_y=3, sigma_c=0)
v03 = v03.removeDirt
v03 = v03.autolevels(filterRadius=0, gamma=1.2)
v03 = v03.UnsharpMask(strength=300, radius=3, threshold=1)
#return v03.histogram("levels").prefetch(6)
return v03.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
