import("..\8mm film 2048x1536 18Fps.mov.avs")
v3 = LWLibavVideoSource(source_dir + "v3f.avi").ConvertToYV24()
v3 = v3.adjustSize()
v3 = v3.AdjustColor(ou=8, ov=-8, x=500, y=300, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, gam_mac=true, red = 0.95, blu=1.02)
return v3.prefetch(6)
/*
v3 = LWLibavVideoSource(source_dir + "v3cg.avi")
v3 = v3.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v3 = v3.removeDirt
v3 = v3.trim(1, 0)
v3 = v3.convertToYV12
v3 = v3.UnsharpMask(strength=300, radius=3, threshold=1)
v3 = v3.adjustBorders
return v3.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate
