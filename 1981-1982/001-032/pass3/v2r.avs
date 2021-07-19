import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v02 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v2f.avi").ConvertToYV24()
v02 = v02.AdjustColor(ou=39, ov=-39, x=300, y=10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
#v02 = v02.colorYUV(off_u=-6)# autowhite=true, autogain=true)
v02 = v02.convertToYV12
v02 = v02.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v02 = v02.removeDirt
v02 = v02.UnsharpMask(strength=300, radius=3, threshold=1)
v02 = v02.adjustBorders
return v02.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
