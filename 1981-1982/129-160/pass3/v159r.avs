import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v159 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v159f.avi").ConvertToYV24()
br_w = 100
br_c = v159.width - br_w
br = v159.trim(41, 41).loop(v159.frameCount).crop(0, 0, -br_c, 0)
v159 = v159.stackHorizontal(br)
v159 = v159.AdjustColor(ou=4, ov=-6, x=300, y=10, w=-0, h=-10, lo_th=0.2, hi_th=0.1, lock_chan=2, sat=2.3, gam_mac=true)
v159 = v159.crop(0, 0, -br_w, 0)
v159 = v159.colorYUV(off_u=-2, off_v=-2)
v159 = v159.autolevels(gamma=1.5, minRng=0)
v159 = v159.convertToYV12
v159 = v159.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v159 = v159.removeDirt
v159 = v159.UnsharpMask(strength=300, radius=3, threshold=1)
v159 = v159.adjustBorders
return v159.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
