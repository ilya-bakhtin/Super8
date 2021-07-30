import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v104 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v104f.avi").ConvertToYV24()
v104_0 = v104.AdjustColor(ou=6, ov=-10, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
br_w = 100
br_c = v104.width - br_w
br = v104.trim(26, 26).loop(v104.frameCount).crop(0, 0, -br_c, 0)
v104 = v104.stackHorizontal(br)
v104 = v104.AdjustColor(ou=6, ov=-10, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v104 = v104.crop(0, 0, -br_w, 0)
v104 = v104_0.trim(0, 58) + v104.trim(59, 68) + v104_0.trim(69, 0)
v104 = v104.colorYUV(off_u=-2, off_v=-2)
v104 = v104.autolevels(autolevel=false, debug=false, input_low=20, input_high=220, gamma=1.3, minRng=0)
v104 = v104.convertToYV12
v104 = v104.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v104 = v104.removeDirt
v104 = v104.UnsharpMask(strength=300, radius=3, threshold=1)
v104 = v104.adjustBorders
return v104.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
