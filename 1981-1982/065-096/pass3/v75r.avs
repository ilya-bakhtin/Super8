import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v75 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v75f.avi").ConvertToYV24()
v75 = v75.AdjustColor(ou=6, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v75 = v75.colorYUV(off_u=-6, off_v=-6)
v75 = v75.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v75 = v75.convertToYV12
v75 = v75.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v75 = v75.removeDirt
v75 = v75.UnsharpMask(strength=300, radius=3, threshold=1)
v75 = v75.adjustBorders
return v75.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
