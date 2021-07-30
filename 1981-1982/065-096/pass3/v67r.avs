import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v67 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v67f.avi").ConvertToYV24()
v67 = v67.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v67 = v67.colorYUV(off_u=-4, off_v=-4)
v67 = v67.autolevels(minRng=0, filterRadius=9, gamma=1.5)
v67 = v67.convertToYV12
v67 = v67.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v67 = v67.removeDirt
v67 = v67.UnsharpMask(strength=200, radius=3, threshold=1)
v67 = v67.adjustBorders
return v67.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
