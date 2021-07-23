import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v52 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v52f.avi").ConvertToYV24()
v52 = v52.AdjustColor(ou=3, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v52 = v52.colorYUV(off_u=-4, off_v=-2)
#v52 = v52.autolevels(filterRadius=9, gamma=1.5)
v52 = v52.convertToYV12
v52 = v52.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v52 = v52.removeDirt
v52 = v52.UnsharpMask(strength=300, radius=3, threshold=1)
v52 = v52.adjustBorders
return v52.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
