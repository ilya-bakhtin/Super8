import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v31 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v31f.avi").ConvertToYV24()
v31 = v31.AdjustColor(ou=0, ov=-4, x=50, y=10, w=-10, h=-10, lo_th=0.2, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v31 = v31.colorYUV(off_u=9, off_v=-9)
#v31 = v31.autolevels(filterRadius=9)
v31 = v31.convertToYV12
v31 = v31.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v31 = v31.removeDirt
v31 = v31.UnsharpMask(strength=300, radius=3, threshold=1)
v31 = v31.adjustBorders
return v31.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
