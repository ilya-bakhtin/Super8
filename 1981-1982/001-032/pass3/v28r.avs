import("..\11943 Bakhtin N8 01.720p_01.mov.avs")
v28 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\001-032\pass2\v28f.avi").ConvertToYV24()
v28 = v28.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
#v28 = v28.colorYUV(off_u=2, off_v=-2)
#v28 = v28.autolevels(filterRadius=9)
v28 = v28.convertToYV12
v28 = v28.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v28 = v28.removeDirt
v28 = v28.UnsharpMask(strength=300, radius=3, threshold=1)
v28 = v28.adjustBorders
return v28.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
