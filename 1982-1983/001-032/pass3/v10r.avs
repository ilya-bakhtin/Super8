import("..\8mm film 2048x1536 18Fps.mov.avs")
v10 = LWLibavVideoSource(source_dir + "v10f.avi").ConvertToYV24()
v10 = v10.adjustSize()
v10 = v10.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, gam_mac=true)
v10 = v10.colorYUV(off_u=10, off_v=-20)
return v10.prefetch(6)
#adjustframerate
