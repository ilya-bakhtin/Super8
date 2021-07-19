import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v22 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v22f.avi").ConvertToYV24()
v22 = v22.AdjustColor(ou=-1, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v22 = v22.colorYUV(off_u=5, off_v=-5)# autowhite=true, autogain=true)
v22 = v22.autolevels(filterRadius=9)
v22 = v22.convertToYV12
v22 = v22.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v22 = v22.removeDirt
v22 = v22.UnsharpMask(strength=200, radius=3, threshold=1)
v22 = v22.adjustBorders
return v22.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
