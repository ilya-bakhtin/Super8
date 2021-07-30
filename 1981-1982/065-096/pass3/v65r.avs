import("..\11943 Bakhtin N8 01.720p_01-65.mov.avs")
v65 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\065-096\pass2\v65f.avi").ConvertToYV24()
v65 = v65.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
#v65 = v65.colorYUV(off_u=-4, off_v=-12)
v65 = v65.autolevels(filterRadius=9, gamma=1.2)
v65 = v65.convertToYV12
v65 = v65.Filter(th_SAD=500, th_SADC=1200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v65 = v65.removeDirt
v65 = v65.UnsharpMask(strength=300, radius=3, threshold=1)
v65 = v65.adjustBorders
return v65.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
