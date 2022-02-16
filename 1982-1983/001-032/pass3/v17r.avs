import("..\8mm film 2048x1536 18Fps.mov.avs")
v17 = LWLibavVideoSource(source_dir + "v17f.avi").ConvertToYV24()
v17 = v17.adjustSize()
v17 = v17.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, gam_mac=true)
v17 = v17.colorYUV(off_u=4, off_v=-4, gamma_y = 0)
return v17.prefetch(6)
#adjustframerate
