import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v99 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v99f.avi").ConvertToYV24()
v99 = v99.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
#v99 = v99.colorYUV(off_u=6, off_v=0)
v99 = v99.autolevels(filterRadius=9, gamma=1.3)
v99 = v99.convertToYV12
v99 = v99.Filter(th_SAD=1000, th_SADC=1000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=3)
v99 = v99.removeDirt
v99 = v99.UnsharpMask(strength=300, radius=3, threshold=1)
v99 = v99.adjustBorders
return v99.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
