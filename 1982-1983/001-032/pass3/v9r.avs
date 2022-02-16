import("..\8mm film 2048x1536 18Fps.mov.avs")
v9 = LWLibavVideoSource(source_dir + "v9f.avi").ConvertToYV24()
v9 = v9.adjustSize()
v9 = v9.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, gam_mac=true)
v9 = v9.colorYUV(off_u=10, off_v=-20)
return v9.prefetch(6)
#adjustframerate
