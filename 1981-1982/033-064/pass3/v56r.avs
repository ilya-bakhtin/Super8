import("..\11943 Bakhtin N8 01.720p_01-33.mov.avs")
v56 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\033-064\pass2\v56f.avi").ConvertToYV24()
v56 = v56.AdjustColor(ou=0, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v56 = v56.colorYUV(off_u=5, off_v=-3)
#v56 = v56.autolevels(filterRadius=9, gamma=1.5)
v56 = v56.convertToYV12
v56 = v56.Filter(th_SAD=200, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v56 = v56.removeDirt
v56 = v56.UnsharpMask(strength=300, radius=3, threshold=1)
v56 = v56.adjustBorders
return v56.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
