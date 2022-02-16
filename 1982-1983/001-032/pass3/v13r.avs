import("..\8mm film 2048x1536 18Fps.mov.avs")
v13 = LWLibavVideoSource(source_dir + "v13f.avi").ConvertToYV24()
v13 = v13.adjustSize()
v13 = v13.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=1.5, gam_mac=true)
v13 = v13.colorYUV(off_u=5, off_v=-5, gamma_y = 0)
return v13.prefetch(6)
#adjustframerate
