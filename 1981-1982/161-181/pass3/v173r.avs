import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v173 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v173f.avi").ConvertToYV24()
br_h = 100
br_c = v161.height - br_h
br = v173.trim(135, 135).loop(v173.frameCount).crop(0, 0, 0, -br_c)
v173 = br.stackVertical(v173)
v173 = v173.AdjustColor(ou=4, ov=-6, x=10, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v173 = v173.crop(0, br_h, 0, 0)
v173 = v173.colorYUV(off_u=-4, off_v=-4)
v173 = v173.autolevels(gamma=1.2, minRng=0)
v173 = v173.convertToYV12
v173 = v173.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v173 = v173.removeDirt
v173 = v173.UnsharpMask(strength=300, radius=3, threshold=1)
v173 = v173.adjustBorders
return v173.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
