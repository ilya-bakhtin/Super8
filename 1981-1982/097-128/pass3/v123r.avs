import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v123 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v123f.avi").ConvertToYV24()
v123 = v123.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v123 = v123.colorYUV(off_u=4, off_v=-2)
#v123 = v123.autolevels(gamma=1.3, minRng=0)
v123 = v123.convertToYV12
v123 = v123.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v123 = v123.removeDirt
v123 = v123.UnsharpMask(strength=300, radius=3, threshold=1)
v123 = v123.adjustBorders
return v123.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
