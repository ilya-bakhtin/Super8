import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v09 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v9f.avi").ConvertToYV24()
v09 = v09.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-10, h=-10, lo_th=0.3, hi_th=0.4, lock_chan=1, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v09 = v09.colorYUV(off_u=-8, off_v=0)# autowhite=true, autogain=true)
v09 = v09.autolevels(filterRadius=9)
v09 = v09.convertToYV12
#v09 = v09.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
#                 truemotion=false, sigma_y=0, sigma_c=0)
v09 = v09.removeDirt
v09 = v09.UnsharpMask(strength=100, radius=3, threshold=1)
v09 = v09.adjustBorders
return v09.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
