import("..\8mm film 2048x1536 18Fps.mov.avs")
v80 = LWLibavVideoSource(source_dir + "v080f.avi", cache=false).ConvertToYV24()
#v80 = v80.crop(0, 8, 0, -4)
v80 = v80.adjustSize()
v80 = v80.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v80 = v80.colorYUV(off_u=4, off_v=-6, gamma_y=0)
return v80.prefetch(6)
#adjustframerate
