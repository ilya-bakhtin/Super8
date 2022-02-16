import("..\8mm film 2048x1536 18Fps.mov.avs")
v84 = LWLibavVideoSource(source_dir + "v084f.avi", cache=false).ConvertToYV24()
#v84 = v84.crop(0, 8, 0, -4)
v84 = v84.adjustSize()
v84 = v84.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v84 = v84.colorYUV(off_u=10, off_v=-14, gamma_y=32)
return v84.prefetch(6)
#adjustframerate
