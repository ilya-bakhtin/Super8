import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v17 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v17f.avi").ConvertToYV24()
v17 = v17.AdjustColor(ou=3, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
#v17 = v17.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
#v17 = v17.autolevels(filterRadius=9)
v17 = v17.convertToYV12
v17 = v17.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v17 = v17.removeDirt
v17 = v17.UnsharpMask(strength=300, radius=3, threshold=1)
v17 = v17.adjustBorders
return v17.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
