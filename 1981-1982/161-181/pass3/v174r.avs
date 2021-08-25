import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v174 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v174f.avi").ConvertToYV24()
v174 = v174.AdjustColor(ou=4, ov=-6, x=10, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v174 = v174.colorYUV(off_u=-6, off_v=-4)
v174 = v174.autolevels(gamma=1.2, minRng=0)
v174 = v174.convertToYV12
v174 = v174.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v174 = v174.removeDirt
v174 = v174.UnsharpMask(strength=300, radius=3, threshold=1)
v174 = v174.adjustBorders
return v174.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
