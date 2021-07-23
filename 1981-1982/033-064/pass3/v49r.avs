import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v49 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v49f.avi").ConvertToYV24()
v49 = v49.AdjustColor(ou=3, ov=-10, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v49 = v49.colorYUV(off_u=-4, off_v=-2)
#v49 = v49.autolevels(filterRadius=9, gamma=1.5)
v49 = v49.convertToYV12
v49 = v49.Filter(th_SAD=200, th_SADC=400, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v49 = v49.removeDirt
v49 = v49.UnsharpMask(strength=300, radius=3, threshold=1)
v49 = v49.adjustBorders
return v49.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
