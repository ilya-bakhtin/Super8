import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v55 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v55f.avi").ConvertToYV24()
v55 = v55.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v55 = v55.colorYUV(off_u=-4, off_v=-2)
#v55 = v55.autolevels(filterRadius=9, gamma=1.5)
v55 = v55.convertToYV12
v55 = v55.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v55 = v55.removeDirt
v55 = v55.UnsharpMask(strength=300, radius=3, threshold=1)
v55 = v55.adjustBorders
return v55.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
