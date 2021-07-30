import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v105 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v105f.avi").ConvertToYV24()
v105 = v105.AdjustColor(ou=6, ov=-10, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v105 = v105.colorYUV(off_u=-2, off_v=-2)
v105 = v105.autolevels(gamma=1.3, minRng=0)
v105 = v105.convertToYV12
v105 = v105.Filter(th_SAD=500, th_SADC=500, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=3, sigma_c=0)
v105 = v105.removeDirt
v105 = v105.UnsharpMask(strength=300, radius=3, threshold=1)
v105 = v105.adjustBorders
return v105.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
