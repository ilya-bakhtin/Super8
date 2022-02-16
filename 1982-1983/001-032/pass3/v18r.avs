import("..\8mm film 2048x1536 18Fps.mov.avs")
v18 = LWLibavVideoSource(source_dir + "v18f.avi").ConvertToYV24()
v18 = v18.adjustSize()
v18 = v18.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, gam_mac=true)
v18 = v18.colorYUV(off_u=4, off_v=-4, gamma_y = 0)
return v18.prefetch(6)
#adjustframerate
