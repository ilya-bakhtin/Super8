import("..\8mm film 2048x1536 18Fps.mov.avs")
v104 = LWLibavVideoSource(source_dir + "v104f.avi", cache=false).ConvertToYV24()
v104 = v104.AdjustColor(ou=-4, ov=2, x=10, y=100, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v104 = v104.colorYUV(off_u=0, off_v=-4, gamma_y=0)
return v104.prefetch(6)
#adjustframerate
