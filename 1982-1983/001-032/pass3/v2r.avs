import("..\8mm film 2048x1536 18Fps.mov.avs")
v2 = LWLibavVideoSource(source_dir + "v2f.avi").ConvertToYV24()
v2 = v2.adjustSize()
v2 = v2.AdjustColor(ou=6, ov=-8, x=300, y=350, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, gam_mac=true, red=1)
v2 = v2.colorYUV(off_u=2, off_v=-2)
return v2.prefetch(6)
/*
v2 = LWLibavVideoSource(source_dir + "v2cg.avi")
v2 = v2.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=32, overlap=16,\
                   truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)
v2 = v2.removeDirt
v2 = v2.trim(1, 0)
v2 = v2.convertToYV12
v2 = v2.UnsharpMask(strength=300, radius=3, threshold=1)
v2 = v2.adjustBorders
#return v2.assumefps(18).AdjustFrameRate(preset_p = "slowest").prefetch(12)
*/
#adjustframerate
