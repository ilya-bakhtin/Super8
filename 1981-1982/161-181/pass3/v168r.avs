import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v168 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v168f.avi").ConvertToYV24()
v168 = v168.AdjustColor(ou=8, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.9, gam_mac=true)
v168 = v168.colorYUV(off_u=-4, off_v=-4)
v168 = v168.autolevels(gamma=1.2, minRng=0)
v168 = v168.convertToYV12
v168 = v168.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v168 = v168.removeDirt
v168 = v168.UnsharpMask(strength=300, radius=3, threshold=1)
v168 = v168.adjustBorders
return v168.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
