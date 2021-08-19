import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v139 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v139f.avi").ConvertToYV24()
v139 = v139.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v139 = v139.colorYUV(off_u=-2, off_v=-4)
v139 = v139.autolevels(gamma=1.1, minRng=0)
v139 = v139.convertToYV12
v139 = v139.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v139 = v139.removeDirt
v139 = v139.UnsharpMask(strength=300, radius=3, threshold=1)
v139 = v139.adjustBorders
return v139.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
