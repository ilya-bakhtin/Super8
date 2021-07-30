import("..\11943 Bakhtin N8 01.720p_01-97.mov.avs")
v103 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\097-128\pass2\v103f.avi").ConvertToYV24()
v103 = v103.AdjustColor(ou=6, ov=-10, x=100, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
#v103 = v103.colorYUV(off_u=6, off_v=0)
v103 = v103.autolevels(gamma=1.5, minRng=0)
v103 = v103.convertToYV12
v103 = v103.Filter(th_SAD=2000, th_SADC=2000, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                 truemotion=false, sigma_y=0, sigma_c=0)
v103 = v103.removeDirt
v103 = v103.UnsharpMask(strength=300, radius=3, threshold=1)
v103 = v103.adjustBorders
return v103.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
