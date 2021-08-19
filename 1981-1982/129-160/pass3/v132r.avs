import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v132 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v132f.avi").ConvertToYV24()
v132 = v132.AdjustColor(ou=4, ov=-12, x=10, y=10, w=-10, h=-10, lo_th=0.02, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
v132 = v132.colorYUV(off_u=-4, off_v=-4)
v132 = v132.autolevels(gamma=1.0, minRng=0)
v132 = v132.convertToYV12
v132 = v132.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v132 = v132.removeDirt
v132 = v132.UnsharpMask(strength=300, radius=3, threshold=1)
v132 = v132.adjustBorders
return v132.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
