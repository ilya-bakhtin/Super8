import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v11 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v11f.avi").ConvertToYV24()
v11 = v11.AdjustColor(ou=15, ov=-17, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v11 = v11.colorYUV(off_u=-10, off_v=6)# autowhite=true, autogain=true)
#v11 = v11.autolevels(filterRadius=9)
v11 = v11.convertToYV12
v11 = v11.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v11 = v11.removeDirt
v11 = v11.UnsharpMask(strength=300, radius=3, threshold=1)
v11 = v11.adjustBorders
return v11.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
