import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v179 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v179f.avi").ConvertToYV24()
v179 = v179.AdjustColor(ou=8, ov=-10, x=400, y=0, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v179 = v179.colorYUV(off_u=-4, off_v=-2)
v179 = v179.autolevels(gamma=1.2, minRng=0)
v179 = v179.convertToYV12
v179 = v179.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=3, sigma_c=3, fft_sharp=0)
v179 = v179.removeDirt
v179 = v179.UnsharpMask(strength=300, radius=3, threshold=1)
v179 = v179.adjustBorders
return v179.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
