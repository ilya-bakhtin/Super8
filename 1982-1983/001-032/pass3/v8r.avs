import("..\8mm film 2048x1536 18Fps.mov.avs")
v8 = LWLibavVideoSource(source_dir + "v8f.avi").ConvertToYV24()
v8 = v8.adjustSize()
v8 = v8.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v8 = v8.colorYUV(off_u=6, off_v=0)
return v8.prefetch(6)
#adjustframerate
