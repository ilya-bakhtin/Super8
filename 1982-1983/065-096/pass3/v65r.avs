import("..\8mm film 2048x1536 18Fps.mov.avs")
v65 = LWLibavVideoSource(source_dir + "v065f.avi", cache=false).ConvertToYV24()
#v65 = v65.crop(0, 8, 0, -4)
v65 = v65.adjustSize()
v65 = v65.AdjustColor(ou=-8, ov=4, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v65 = v65.colorYUV(off_u=6, off_v=0, gamma_y=64)
return v65.prefetch(6)
#adjustframerate
