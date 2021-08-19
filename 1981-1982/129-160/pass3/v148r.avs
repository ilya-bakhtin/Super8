import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v148 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v148f.avi").ConvertToYV24()
v148 = v148.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=false) #intentional false
v148 = v148.colorYUV(off_u=6, off_v=-6)
#v148 = v148.autolevels(gamma=1.1, minRng=0)
v148 = v148.convertToYV12
v148 = v148.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v148 = v148.removeDirt
v148 = v148.UnsharpMask(strength=300, radius=3, threshold=1)
v148 = v148.adjustBorders
return v148.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
