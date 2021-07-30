import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v79 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v79f.avi").ConvertToYV24()
v79 = v79.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v79 = v79.colorYUV(off_u=-5, off_v=-5)
v79 = v79.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v79 = v79.convertToYV12
v79 = v79.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v79 = v79.removeDirt
v79 = v79.UnsharpMask(strength=300, radius=3, threshold=1)
v79 = v79.adjustBorders
return v79.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
