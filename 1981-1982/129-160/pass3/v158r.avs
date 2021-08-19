import("..\11943 Bakhtin N8 01.720p_01-129.mov.avs")
v158 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\129-160\pass2\v158f.avi").ConvertToYV24()
v158 = v158.AdjustColor(ou=4, ov=-6, x=300, y=10, w=-0, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=2, sat=1.9, gam_mac=true)
v158 = v158.colorYUV(off_u=-2, off_v=-2)
v158 = v158.autolevels(gamma=1.2, minRng=0)
v158 = v158.convertToYV12
v158 = v158.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=2, sigma_c=0, fft_sharp=1)
v158 = v158.removeDirt
v158 = v158.UnsharpMask(strength=300, radius=3, threshold=1)
v158 = v158.adjustBorders
return v158.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
