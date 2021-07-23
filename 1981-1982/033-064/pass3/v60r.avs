import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v60 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v60f.avi").ConvertToYV24()
v60 = v60.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v60 = v60.colorYUV(off_u=-2, off_v=-2)
#v60 = v60.autolevels(filterRadius=9, gamma=1.5)
v60 = v60.convertToYV12
v60 = v60.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v60 = v60.removeDirt
v60 = v60.UnsharpMask(strength=300, radius=3, threshold=1)
v60 = v60.adjustBorders
return v60.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
