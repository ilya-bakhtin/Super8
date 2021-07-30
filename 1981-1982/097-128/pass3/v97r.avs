import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v97 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v97f.avi").ConvertToYV24()
v97 = v97.AdjustColor(ou=16, ov=-16, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.3, gam_mac=true)
v97 = v97.colorYUV(off_u=-4, off_v=0)
v97 = v97.autolevels(filterRadius=9, gamma=1.2)
v97 = v97.convertToYV12
v97 = v97.Filter(th_SAD=1000, th_SADC=1200, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v97 = v97.removeDirt
v97 = v97.UnsharpMask(strength=300, radius=3, threshold=1)
v97 = v97.adjustBorders
return v97.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
