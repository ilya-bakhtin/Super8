import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v156 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v156f.avi").ConvertToYV24()
v156 = v156.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v156 = v156.colorYUV(off_u=-4, off_v=-4)
v156 = v156.autolevels(gamma=1.2, minRng=0)
v156 = v156.convertToYV12
v156 = v156.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v156 = v156.removeDirt
v156 = v156.UnsharpMask(strength=300, radius=3, threshold=1)
v156 = v156.adjustBorders
return v156.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
