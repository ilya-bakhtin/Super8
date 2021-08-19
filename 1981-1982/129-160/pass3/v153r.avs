import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v153 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v153f.avi").ConvertToYV24()
v153 = v153.AdjustColor(ou=6, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v153 = v153.colorYUV(off_u=-2, off_v=0)
v153 = v153.autolevels(gamma=1.2, minRng=0)
v153 = v153.convertToYV12
v153 = v153.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v153 = v153.removeDirt
v153 = v153.UnsharpMask(strength=300, radius=3, threshold=1)
v153 = v153.adjustBorders
return v153.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
