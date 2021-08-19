import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v136 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v136f.avi").ConvertToYV24()
v136 = v136.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v136 = v136.colorYUV(off_u=-4, off_v=-4)
#v136 = v136.autolevels(gamma=1.0, minRng=0)
v136 = v136.convertToYV12
v136 = v136.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v136 = v136.removeDirt
v136 = v136.UnsharpMask(strength=300, radius=3, threshold=1)
v136 = v136.adjustBorders
return v136.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
