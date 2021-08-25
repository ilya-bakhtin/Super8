import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v177 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v177f.avi").ConvertToYV24()
v177 = v177.AdjustColor(ou=4, ov=-6, x=400, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v177 = v177.colorYUV(off_u=-6, off_v=-4)
v177 = v177.autolevels(gamma=1.2, minRng=0)
v177 = v177.convertToYV12
v177 = v177.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v177 = v177.removeDirt
v177 = v177.UnsharpMask(strength=300, radius=3, threshold=1)
v177 = v177.adjustBorders
return v177.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
