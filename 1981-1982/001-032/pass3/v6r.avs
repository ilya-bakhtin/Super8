import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v06 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v6f.avi").ConvertToYV24()
v06 = v06.AdjustColor(ou=5, ov=-5, x=10, y=10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.5, red = 1, grn = 1, blu = 1, gam_mac=true)
v06 = v06.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v06 = v06.convertToYV12
v06 = v06.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v06 = v06.removeDirt
v06 = v06.UnsharpMask(strength=300, radius=3, threshold=1)
v06 = v06.adjustBorders
return v06.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
