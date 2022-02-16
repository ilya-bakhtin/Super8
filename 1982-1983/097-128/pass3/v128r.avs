import("..\8mm film 2048x1536 18Fps.mov.avs")
v128 = LWLibavVideoSource(source_dir + "v128f.avi", cache=false).ConvertToYV24()
v128 = v128.colorYUV(off_y=10)
v128 = v128.AdjustColor(ou=-0, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#return v128.histogram("levels").prefetch(6)
#v128 = v128.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
v128 = v128.adjustBorders
return v128.prefetch(6)
#adjustframerate
