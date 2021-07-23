import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v34 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v34f.avi").ConvertToYV24()
v34 = v34.AdjustColor(ou=3, ov=-7, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v34 = v34.colorYUV(off_u=-3, off_v=0)
v34 = v34.autolevels(filterRadius=9, gamma=1.3)
v34 = v34.convertToYV12
v34 = v34.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v34 = v34.removeDirt
v34 = v34.UnsharpMask(strength=200, radius=3, threshold=1)
v34 = v34.adjustBorders
return v34.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
