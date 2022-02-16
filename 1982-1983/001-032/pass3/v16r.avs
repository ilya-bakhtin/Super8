import("..\8mm film 2048x1536 18Fps.mov.avs")
v16 = LWLibavVideoSource(source_dir + "v16f.avi").ConvertToYV24()
v16 = v16.adjustSize()
v16 = v16.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=1.5, gam_mac=true)
v16 = v16.colorYUV(off_u=7, off_v=-7, gamma_y = 0)
return v16.prefetch(6)
#adjustframerate
