import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v58 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v58f.avi").ConvertToYV24()
v58 = v58.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.2, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
#v58 = v58.colorYUV(off_u=-2, off_v=0)
#v58 = v58.autolevels(filterRadius=9, gamma=1.5)
v58 = v58.convertToYV12
v58 = v58.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v58 = v58.removeDirt
v58 = v58.UnsharpMask(strength=300, radius=3, threshold=1)
v58 = v58.adjustBorders
return v58.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
