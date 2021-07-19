import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v32 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v32f.avi").ConvertToYV24()
v32 = v32.AdjustColor(ou=3, ov=-7, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
v32 = v32.colorYUV(off_u=3, off_v=-3)
#v32 = v32.autolevels(filterRadius=9)
v32 = v32.convertToYV12
v32 = v32.Filter(th_SAD=100, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v32 = v32.removeDirt
v32 = v32.UnsharpMask(strength=300, radius=3, threshold=1)
v32 = v32.adjustBorders
return v32.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
