import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v88 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v88f.avi").ConvertToYV24()
v88 = v88.AdjustColor(ou=2, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v88 = v88.colorYUV(off_u=-2, off_v=-2)
v88 = v88.autolevels(filterRadius=3, gamma=1.1, ignore_high=0.0003)
v88 = v88.convertToYV12
v88 = v88.Filter(th_SAD=1000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=7, sigma_c=0)
v88 = v88.removeDirt
v88 = v88.UnsharpMask(strength=300, radius=3, threshold=1)
v88 = v88.adjustBorders
return v88.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
