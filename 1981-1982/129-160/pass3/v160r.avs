import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v160 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v160f.avi").ConvertToYV24()
v160 = v160.AdjustColor(ou=4, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v160 = v160.colorYUV(off_u=-6, off_v=-6)
v160 = v160.autolevels(gamma=1.2, minRng=0)
v160 = v160.convertToYV12
v160 = v160.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v160 = v160.removeDirt
v160 = v160.UnsharpMask(strength=300, radius=3, threshold=1)
v160 = v160.adjustBorders
return v160.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
