import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v154 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v154f.avi").ConvertToYV24()
br_h = 100
br_c = v154.height - br_h
br = v154.trim(222, 222).loop(v154.frameCount).crop(0, 0, 0, -br_c)
v154 = br.stackVertical(v154)
v154 = v154.AdjustColor(ou=6, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v154 = v154.crop(0, br_h, 0, 0)
v154 = v154.colorYUV(off_u=-4, off_v=-4)
v154 = v154.autolevels(gamma=1.2, minRng=0)
v154 = v154.convertToYV12
v154 = v154.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v154 = v154.removeDirt
v154 = v154.UnsharpMask(strength=300, radius=3, threshold=1)
v154 = v154.adjustBorders
return v154.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
