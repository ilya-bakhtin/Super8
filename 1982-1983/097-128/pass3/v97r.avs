import("..\8mm film 2048x1536 18Fps.mov.avs")
v97 = LWLibavVideoSource(source_dir + "v097f.avi", cache=false).ConvertToYV24()
v97 = v97.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v97 = v97.colorYUV(off_u=14, off_v=-14, gamma_y=64)
return v97.prefetch(6)
#adjustframerate
