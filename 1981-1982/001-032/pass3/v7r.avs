import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v07 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v7f.avi").ConvertToYV24()
v07 = v07.AdjustColor(ou=5, ov=-7, x=10, y=10, w=-100, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v07 = v07.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v07 = v07.convertToYV12
v07 = v07.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v07 = v07.removeDirt
v07 = v07.UnsharpMask(strength=300, radius=3, threshold=1)
v07 = v07.adjustBorders
return v07.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
