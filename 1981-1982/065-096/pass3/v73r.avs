import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v73 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v73f.avi").ConvertToYV24()
v73 = v73.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.02, lock_chan=1, sat=1.9, gam_mac=true)
v73 = v73.colorYUV(off_u=-6, off_v=-4)
v73 = v73.autolevels(filterRadius=9, gamma=1.2, ignore_high=0)
v73 = v73.convertToYV12
v73 = v73.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v73 = v73.removeDirt
v73 = v73.UnsharpMask(strength=300, radius=3, threshold=1)
v73 = v73.adjustBorders
return v73.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
