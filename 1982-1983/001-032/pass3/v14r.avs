import("..\8mm film 2048x1536 18Fps.mov.avs")
v14 = LWLibavVideoSource(source_dir + "v14f.avi").ConvertToYV24()
v14 = v14.adjustSize()
v14 = v14.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=1.5, gam_mac=true)
v14 = v14.colorYUV(off_u=5, off_v=-5, gamma_y = 0)
return v14.prefetch(6)
#adjustframerate
