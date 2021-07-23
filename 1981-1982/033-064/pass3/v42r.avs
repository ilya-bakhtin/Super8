import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v42 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v42f.avi").ConvertToYV24()
v42 = v42.AdjustColor(ou=-5, ov=-5, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=1.9, gam_mac=true)
v42 = v42.colorYUV(off_u=5, off_v=-5)
v42 = v42.autolevels(filterRadius=9, gamma=1.5)
v42 = v42.convertToYV12
v42 = v42.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v42 = v42.removeDirt
v42 = v42.UnsharpMask(strength=300, radius=3, threshold=1)
v42 = v42.adjustBorders
return v42.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
