import("..\8mm film 2048x1536 18Fps.mov.avs")
v5 = LWLibavVideoSource(source_dir + "v5f.avi").ConvertToYV24()
v5 = v5.adjustSize()
v5 = v5.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v5 = v5.colorYUV(off_u=6, off_v=0)
return v5.prefetch(6)
/*
v5 = LWLibavVideoSource(source_dir + "v5cg.avi")
v5 = v5.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v5 = v5.removeDirt
v5 = v5.trim(1, 0)
v5 = v5.convertToYV12
v5 = v5.UnsharpMask(strength=300, radius=5, threshold=1)
v5 = v5.adjustBorders
return v5.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate
