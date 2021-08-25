import("..\11943 Bakhtin N8 01.720p_01-161.mov.avs")
v166 = LWLibavVideoSource("D:\users\ilx\wrk\video\Super8\1981-1982\161-181\pass2\v166f.avi").ConvertToYV24()
v166 = v166.AdjustColor(ou=8, ov=-6, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.9, gam_mac=true)
v166 = v166.colorYUV(off_u=-6, off_v=-6)
v166 = v166.autolevels(gamma=1.2, minRng=0)
v166 = v166.convertToYV12
v166 = v166.Filter(th_SAD=200, th_SADC=200, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v166 = v166.removeDirt
v166 = v166.UnsharpMask(strength=300, radius=3, threshold=1)
v166 = v166.adjustBorders
v166 = v166.trim(0, v166.frameCount - 4)
return v166.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
