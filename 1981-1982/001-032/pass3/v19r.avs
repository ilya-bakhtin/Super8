import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v19 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v19f.avi").ConvertToYV24()
v19 = v19.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v19 = v19.colorYUV(off_u=5, off_v=-5)# autowhite=true, autogain=true)
#v19 = v19.autolevels(filterRadius=9)
v19 = v19.convertToYV12
v19 = v19.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v19 = v19.removeDirt
v19 = v19.UnsharpMask(strength=300, radius=3, threshold=1)
v19 = v19.adjustBorders
return v19.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
