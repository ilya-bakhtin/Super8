import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v78 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v78f.avi").ConvertToYV24()
v78 = v78.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v78 = v78.colorYUV(off_u=-3, off_v=-3)
v78 = v78.autolevels(filterRadius=9, gamma=1.3, ignore_high=0.0003)
v78 = v78.convertToYV12
v78 = v78.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v78 = v78.removeDirt
v78 = v78.UnsharpMask(strength=300, radius=3, threshold=1)
v78 = v78.adjustBorders
return v78.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
