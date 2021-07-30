import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v101 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v101f.avi").ConvertToYV24()
v101 = v101.AdjustColor(ou=4, ov=-8, x=100, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.2, lock_chan=0, sat=1.9, gam_mac=true)
#v101 = v101.colorYUV(off_u=6, off_v=0)
v101 = v101.autolevels(gamma=1.5, minRng=0)
v101 = v101.convertToYV12
v101 = v101.Filter(th_SAD=4000, th_SADC=4000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v101 = v101.removeDirt
v101 = v101.UnsharpMask(strength=300, radius=3, threshold=1)
v101 = v101.adjustBorders
return v101.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
