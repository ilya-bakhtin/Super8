import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v119 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v119f.avi").ConvertToYV24()
v119 = v119.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v119 = v119.colorYUV(off_u=4, off_v=-2)
#v119 = v119.autolevels(gamma=1.3, minRng=0)
v119 = v119.convertToYV12
v119 = v119.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v119 = v119.removeDirt
v119 = v119.UnsharpMask(strength=300, radius=3, threshold=1)
v119 = v119.adjustBorders
return v119.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
