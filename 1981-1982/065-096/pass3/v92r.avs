import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v92 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v92f.avi").ConvertToYV24()
br_w = 100
br_c = br_w - v92.width
br = v92.trim(69, 69).loop(v92.frameCount).crop(0, 0, br_c, 0)
v92 = v92.stackHorizontal(br)
v92 = v92.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v92 = v92.crop(0, 0, -br_w, 0)
v92 = v92.colorYUV(off_u=-4, off_v=-4)
v92 = v92.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.003)
v92 = v92.convertToYV12
v92 = v92.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v92 = v92.removeDirt
v92 = v92.UnsharpMask(strength=300, radius=3, threshold=1)
v92 = v92.adjustBorders
return v92.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
