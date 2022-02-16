import("..\8mm film 2048x1536 18Fps.mov.avs")
v157 = LWLibavVideoSource(source_dir + "v157f.avi", cache=false).ConvertToYV24()
v157 = v157.colorYUV(off_y=6)
v157 = v157.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v157 = v157.colorYUV(off_u=-2, off_v=2)
v157 = v157.adjustBorders
return v157.prefetch(6)
#adjustframerate
