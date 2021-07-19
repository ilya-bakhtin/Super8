import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v21 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v21f.avi").ConvertToYV24()
v21 = v21.AdjustColor(ou=-3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v21 = v21.colorYUV(off_u=5, off_v=-5)# autowhite=true, autogain=true)
v21 = v21.autolevels(filterRadius=9)
v21 = v21.convertToYV12
v21 = v21.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v21 = v21.removeDirt
v21 = v21.UnsharpMask(strength=300, radius=3, threshold=1)
v21 = v21.adjustBorders
return v21.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
