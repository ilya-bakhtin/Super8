import("..\8mm film 2048x1536 18Fps.mov.avs")
v1 = LWLibavVideoSource(source_dir + "v1f.avi").ConvertToYV24()
v1 = v1.adjustSize()
v1 = v1.AdjustColor(ou=6, ov=-8, x=300, y=250, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, gam_mac=true, red=1, blu=1.0)
return v1.prefetch(6)
/*
v1 = LWLibavVideoSource(source_dir + "v1cg.avi")
v1 = v1.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v1 = v1.removeDirt
v1 = v1.trim(1, 0)
v1 = v1.convertToYV12
v1 = v1.UnsharpMask(strength=300, radius=3, threshold=1)
v1 = v1.adjustBorders
return v1.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate
