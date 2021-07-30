import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v94 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v94f.avi").ConvertToYV24()
v94 = v94.AdjustColor(ou=4, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v94 = v94.colorYUV(off_u=-4, off_v=-4)
v94 = v94.autolevels(filterRadius=3, gamma=1.1, ignore_high=0.003)
v94 = v94.convertToYV12
v94 = v94.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v94 = v94.removeDirt
v94 = v94.UnsharpMask(strength=300, radius=3, threshold=1)
v94 = v94.adjustBorders
return v94.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
