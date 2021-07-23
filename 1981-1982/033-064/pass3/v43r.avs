import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v43 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v43f.avi").ConvertToYV24()
v43 = v43.AdjustColor(ou=-5, ov=-5, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.5, gam_mac=false)
#v43 = v43.colorYUV(off_u=5, off_v=-5)
v43 = v43.autolevels(filterRadius=9, gamma=1.5)
v43 = v43.convertToYV12
v43 = v43.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v43 = v43.removeDirt
v43 = v43.UnsharpMask(strength=300, radius=3, threshold=1)
v43 = v43.adjustBorders
return v43.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
