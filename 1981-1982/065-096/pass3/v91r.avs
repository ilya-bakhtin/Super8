import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v91 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v91f.avi").ConvertToYV24()
v91 = v91.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, gam_mac=true)
v91 = v91.colorYUV(off_u=-8, off_v=-4)
v91 = v91.autolevels(filterRadius=3, gamma=1.3, ignore_high=0.003)
v91 = v91.convertToYV12
v91 = v91.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v91 = v91.removeDirt
v91 = v91.UnsharpMask(strength=300, radius=3, threshold=1)
v91 = v91.adjustBorders
return v91.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
