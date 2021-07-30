import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v89 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v89f.avi").ConvertToYV24()
v89 = v89.AdjustColor(ou=2, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v89 = v89.colorYUV(off_u=-4, off_v=-4)
v89 = v89.autolevels(filterRadius=3, gamma=1.2, ignore_high=0.0003)
v89 = v89.convertToYV12
v89 = v89.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v89 = v89.removeDirt
v89 = v89.UnsharpMask(strength=300, radius=3, threshold=1)
v89 = v89.adjustBorders
return v89.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
