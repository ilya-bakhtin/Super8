import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v33 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v33f.avi").ConvertToYV24()
v33 = v33.AdjustColor(ou=3, ov=-12, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
#v33 = v33.colorYUV(off_u=3, off_v=-3)
#v33 = v33.autolevels(filterRadius=9)
v33 = v33.convertToYV12
v33 = v33.Filter(th_SAD=500, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v33 = v33.removeDirt
v33 = v33.UnsharpMask(strength=300, radius=3, threshold=1)
v33 = v33.adjustBorders
return v33.assumefps(6).AdjustFrameRate(preset_p = "slowest").prefetch(12)
