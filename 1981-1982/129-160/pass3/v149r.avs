import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v149 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v149f.avi").ConvertToYV24()
v149 = v149.AdjustColor(ou=0, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v149 = v149.colorYUV(off_u=10, off_v=-10)
#v149 = v149.autolevels(gamma=1.1, minRng=0)
v149 = v149.convertToYV12
v149 = v149.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0)
v149 = v149.removeDirt
v149 = v149.UnsharpMask(strength=300, radius=3, threshold=1)
v149 = v149.adjustBorders
return v149.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
