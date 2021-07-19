import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v14 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v14f.avi").ConvertToYV24()
v14 = v14.AdjustColor(ou=3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v14 = v14.colorYUV(off_u=4, off_v=-4)# autowhite=true, autogain=true)
#v14 = v14.autolevels(filterRadius=9)
v14 = v14.convertToYV12
v14 = v14.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v14 = v14.removeDirt
v14 = v14.UnsharpMask(strength=300, radius=3, threshold=1)
v14 = v14.adjustBorders
return v14.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
