import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v161 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v161f.avi").ConvertToYV24()
br_w = 400
br_c = v161.width - br_w
br = v161.trim(89, 89).loop(v161.frameCount).crop(br_c, 0, 0, 0)
v161 = v161.stackHorizontal(br)
v161 = v161.AdjustColor(ou=8, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.2, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v161 = v161.crop(0, 0, -br_w, 0)
v161 = v161.colorYUV(off_u=-6, off_v=-6)
v161 = v161.autolevels(gamma=1.2, minRng=0)
v161 = v161.convertToYV12
v161 = v161.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v161 = v161.removeDirt
v161 = v161.UnsharpMask(strength=300, radius=3, threshold=1)
v161 = v161.adjustBorders
return v161.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
