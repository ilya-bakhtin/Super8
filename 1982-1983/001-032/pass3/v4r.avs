import("..\8mm film 2048x1536 18Fps.mov.avs")
v4 = LWLibavVideoSource(source_dir + "v4f.avi").ConvertToYV24()
v4 = v4.adjustSize()
v4 = v4.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v4 = v4.colorYUV(off_u=6, off_v=0)
return v4.prefetch(6)
/*
v4 = LWLibavVideoSource(source_dir + "v4cg.avi")
v4 = v4.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v4 = v4.removeDirt
v4 = v4.convertToYV12
v4 = v4.UnsharpMask(strength=300, radius=5, threshold=1)
v4 = v4.adjustBorders
return v4.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate
