import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v85 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v85f.avi").ConvertToYV24()
v85 = v85.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=2, sat=1.9, gam_mac=true)
#v85 = v85.colorYUV(off_u=-6, off_v=-3)
v85 = v85.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.0003)
v85 = v85.convertToYV12
v85 = v85.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v85 = v85.removeDirt
v85 = v85.UnsharpMask(strength=300, radius=3, threshold=1)
v85 = v85.adjustBorders
return v85.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
