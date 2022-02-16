import("..\8mm film 2048x1536 18Fps.mov.avs")
v12 = LWLibavVideoSource(source_dir + "v12f.avi").ConvertToYV24()
v12 = v12.adjustSize()
v12 = v12.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=2, gam_mac=true)
v12 = v12.colorYUV(off_u=10, off_v=-20, gamma_y = 32)
return v12.prefetch(6)
#adjustframerate
