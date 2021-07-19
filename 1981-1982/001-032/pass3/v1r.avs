import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v01 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v1f.avi").ConvertToYV24()
v01 = v01.AdjustColor(ou=9, ov=-12, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v01 = v01.colorYUV(off_u=-4)# autowhite=true, autogain=true)
v01 = v01.convertToYV12
v01 = v01.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v01 = v01.removeDirt
v01 = v01.UnsharpMask(strength=300, radius=3, threshold=1)
v01 = v01.adjustBorders
return v01.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
