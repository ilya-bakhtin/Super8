import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v155 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v155f.avi").ConvertToYV24()
v155 = v155.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
v155 = v155.colorYUV(off_u=-4, off_v=-4)
v155 = v155.autolevels(gamma=1.2, minRng=0)
v155 = v155.convertToYV12
v155 = v155.Filter(th_SAD=300, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=0, fft_sharp=1)
v155 = v155.removeDirt
v155 = v155.UnsharpMask(strength=300, radius=3, threshold=1)
v155 = v155.adjustBorders
return v155.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
