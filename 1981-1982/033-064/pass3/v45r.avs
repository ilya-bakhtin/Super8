import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v45 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v45f.avi").ConvertToYV24()
v45 = v45.AdjustColor(ou=3, ov=-10, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
v45 = v45.colorYUV(off_u=5, off_v=-5)
#v45 = v45.autolevels(filterRadius=9, gamma=1.5)
v45 = v45.convertToYV12
v45 = v45.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v45 = v45.removeDirt
v45 = v45.adjustBorders
v45 = v45.UnsharpMask(strength=300, radius=3, threshold=1)
return v45.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
