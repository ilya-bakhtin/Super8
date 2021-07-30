import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v98 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v98f.avi").ConvertToYV24()
v98 = v98.AdjustColor(ou=4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v98 = v98.colorYUV(off_u=6, off_v=0)
v98 = v98.autolevels(filterRadius=9, gamma=1.2)
v98 = v98.convertToYV12
v98 = v98.Filter(th_SAD=4000, th_SADC=4000, dct=0, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=6, sigma_c=6)
v98 = v98.removeDirt
v98 = v98.UnsharpMask(strength=300, radius=3, threshold=1)
v98 = v98.adjustBorders
return v98.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
