import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v72 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v72f.avi").ConvertToYV24()
v72 = v72.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=1, sat=1.9, gam_mac=true)
v72 = v72.colorYUV(off_u=-8, off_v=-8)
v72 = v72.autolevels(filterRadius=9, gamma=1.3)
v72 = v72.convertToYV12
v72 = v72.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v72 = v72.removeDirt
v72 = v72.UnsharpMask(strength=300, radius=3, threshold=1)
v72 = v72.adjustBorders
return v72.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
