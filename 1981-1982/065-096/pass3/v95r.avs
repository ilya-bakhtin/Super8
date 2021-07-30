import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v95 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v95f.avi").ConvertToYV24()
v95 = v95.AdjustColor(ou=4, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v95 = v95.colorYUV(off_u=-4, off_v=-4)
v95 = v95.autolevels(filterRadius=3, gamma=1.1, ignore_high=0.003)
v95 = v95.convertToYV12
v95 = v95.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v95 = v95.removeDirt
v95 = v95.UnsharpMask(strength=300, radius=3, threshold=1)
v95 = v95.adjustBorders
return v95.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
