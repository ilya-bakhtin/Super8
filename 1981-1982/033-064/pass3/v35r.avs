import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v35 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v35f.avi").ConvertToYV24()
v35 = v35.AdjustColor(ou=3, ov=-7, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
v35 = v35.colorYUV(off_u=-6, off_v=0)
v35 = v35.autolevels(filterRadius=9, gamma=1.5)
v35 = v35.convertToYV12
v35 = v35.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v35 = v35.removeDirt
v35 = v35.UnsharpMask(strength=200, radius=3, threshold=1)
v35 = v35.adjustBorders
return v35.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
