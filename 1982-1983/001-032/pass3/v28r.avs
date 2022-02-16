import("..\8mm film 2048x1536 18Fps.mov.avs")
v28 = LWLibavVideoSource(source_dir + "v28f.avi").ConvertToYV24()
v28 = v28.crop(4, 12, 0, 0)
v28 = v28.adjustSize()
v28 = v28.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2.5, grn=1, gam_mac=true)
v28 = v28.colorYUV(off_u=4, off_v=-4, gamma_y = 0)
return v28.prefetch(6)
#adjustframerate
