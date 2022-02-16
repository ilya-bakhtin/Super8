import("..\8mm film 2048x1536 18Fps.mov.avs")
v11 = LWLibavVideoSource(source_dir + "v11f.avi").ConvertToYV24()
v11 = v11.adjustSize()
v11 = v11.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, gam_mac=true)
v11 = v11.colorYUV(off_u=10, off_v=-20, gamma_y = -32)
return v11.prefetch(6)
#adjustframerate
