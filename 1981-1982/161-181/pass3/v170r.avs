import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v170 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v170f.avi").ConvertToYV24()
v170 = v170.trim(1, 0)
v170 = v170.AdjustColor(ou=2, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v170 = v170.colorYUV(off_u=-2, off_v=-2)
v170 = v170.autolevels(gamma=1.2, minRng=0)
v170 = v170.convertToYV12
v170 = v170.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v170 = v170.removeDirt
v170 = v170.UnsharpMask(strength=300, radius=3, threshold=1)
v170 = v170.adjustBorders
return v170.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
