import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v157 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v157f.avi").ConvertToYV24()
v157 = v157.AdjustColor(ou=6, ov=-8, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v157 = v157.colorYUV(off_u=-2, off_v=-2)
v157 = v157.autolevels(gamma=1.2, minRng=0)
v157 = v157.convertToYV12
v157 = v157.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v157 = v157.removeDirt
v157 = v157.UnsharpMask(strength=300, radius=3, threshold=1)
v157 = v157.adjustBorders
return v157.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
