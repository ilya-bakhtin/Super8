import("..\8mm film 2048x1536 18Fps.mov.avs")
v6 = LWLibavVideoSource(source_dir + "v6f.avi").ConvertToYV24()
v6 = v6.adjustSize()
v6 = v6.AdjustColor(ou=-4, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.2, gam_mac=true)
v6 = v6.colorYUV(off_u=6, off_v=0)
return v6.prefetch(6)
#adjustframerate
