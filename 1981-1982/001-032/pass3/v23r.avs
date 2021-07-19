import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v23 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v23f.avi").ConvertToYV24()
v23 = v23.AdjustColor(ou=-1, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v23 = v23.colorYUV(off_u=5, off_v=-5)
#v23 = v23.autolevels(filterRadius=9)
v23 = v23.convertToYV12
#v23 = v23.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v23 = v23.removeDirt
v23 = v23.UnsharpMask(strength=200, radius=3, threshold=1)
v23 = v23.adjustBorders
return v23.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
