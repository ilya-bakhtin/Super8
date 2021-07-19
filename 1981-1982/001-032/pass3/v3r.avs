import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v03 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v3f.avi").ConvertToYV24()
v03 = v03.AdjustColor(ou=5, ov=-5, x=10, y=10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
#v03 = v03.colorYUV(off_u=-6)# autowhite=true, autogain=true)
v03 = v03.convertToYV12
v03 = v03.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v03 = v03.removeDirt
v03 = v03.UnsharpMask(strength=300, radius=3, threshold=1)
v03 = v03.adjustBorders
return v03.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
