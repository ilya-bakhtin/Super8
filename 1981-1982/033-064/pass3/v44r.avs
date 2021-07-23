import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v44 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v44f.avi").ConvertToYV24()
v44 = v44.trim(1, 0)
v44 = v44.AdjustColor(ou=3, ov=-10, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=2, sat=1.9, gam_mac=true)
#v44 = v44.colorYUV(off_u=5, off_v=-5)
v44 = v44.autolevels(filterRadius=9, gamma=1.5)
v44 = v44.convertToYV12
v44 = v44.Filter(th_SAD=300, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v44 = v44.removeDirt
v44 = v44.UnsharpMask(strength=300, radius=3, threshold=1)
v44 = v44.adjustBorders
return v44.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
