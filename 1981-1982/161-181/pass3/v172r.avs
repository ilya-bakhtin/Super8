import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v172 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v172f.avi").ConvertToYV24()
v172 = v172.AdjustColor(ou=-2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=false)
v172 = v172.colorYUV(off_u=-2, off_v=-2)
v172 = v172.autolevels(gamma=1.2, minRng=0, ignore_low=0, ignore_high=0)
v172 = v172.convertToYV12
v172 = v172.Filter(th_SAD=1200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v172 = v172.removeDirt
v172 = v172.UnsharpMask(strength=300, radius=3, threshold=1)
v172 = v172.adjustBorders
return v172.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
