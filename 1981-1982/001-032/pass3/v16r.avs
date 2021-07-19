import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v16 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v16f.avi").ConvertToYV24()
v16_1 = v16.trim(0, 66)
v16_2 = v16.trim(67, 0)
br_w = 80
br_c = br_w - v16_2.width
br = v16_1.trim(66, 66).loop(v16_2.frameCount).crop(0, 0, br_c, 0)
v16_2 = v16_2.stackHorizontal(br)
v16_1 = v16_1.AdjustColor(ou=3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v16_2 = v16_2.AdjustColor(ou=3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, red = 1, grn = 1, blu = 1, gam_mac=true)
v16 = v16_1 + v16_2.crop(0, 0, -br_w, 0)
v16 = v16.colorYUV(off_u=-2, off_v=-2)# autowhite=true, autogain=true)
v16 = v16.autolevels(filterRadius=9)
v16 = v16.convertToYV12
v16 = v16.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v16 = v16.removeDirt
v16 = v16.UnsharpMask(strength=300, radius=3, threshold=1)
v16 = v16.adjustBorders
return v16.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
