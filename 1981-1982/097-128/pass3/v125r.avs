import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v125 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v125f.avi").ConvertToYV24()
v125 = v125.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
#v125 = v125.colorYUV(off_u=4, off_v=-2)
#v125 = v125.autolevels(gamma=1.3, minRng=0)
v125 = v125.convertToYV12
v125 = v125.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=3, sigma_c=0)
v125 = v125.removeDirt
v125 = v125.UnsharpMask(strength=300, radius=3, threshold=1)
v125 = v125.adjustBorders
return v125.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
