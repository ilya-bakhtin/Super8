import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v96 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v96f.avi").ConvertToYV24()
v96 = v96.AdjustColor(ou=4, ov=-14, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1, gam_mac=true)
v96 = v96.colorYUV(off_u=-4, off_v=-4)
v96 = v96.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.003)
v96 = v96.convertToYV12
v96 = v96.Filter(th_SAD=500, th_SADC=500, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v96 = v96.removeDirt
v96 = v96.UnsharpMask(strength=300, radius=3, threshold=1)
v96 = v96.adjustBorders
return v96.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
