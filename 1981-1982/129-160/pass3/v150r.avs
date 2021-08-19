import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v150 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v150f.avi").ConvertToYV24()
v150 = v150.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v150 = v150.colorYUV(off_u=10, off_v=-10)
#v150 = v150.autolevels(gamma=1.1, minRng=0)
v150 = v150.convertToYV12
v150 = v150.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v150 = v150.removeDirt
v150 = v150.UnsharpMask(strength=300, radius=3, threshold=1)
v150 = v150.adjustBorders
return v150.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
