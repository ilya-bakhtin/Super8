import("..\8mm film 2048x1536 18Fps.mov.avs")
v68 = LWLibavVideoSource(source_dir + "v068f.avi", cache=false).ConvertToYV24()
#v68 = v68.crop(0, 8, 0, -4)
v68 = v68.adjustSize()
v68 = v68.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v68 = v68.colorYUV(off_u=2, off_v=-2, gamma_y=48)
return v68.prefetch(6)
#adjustframerate
