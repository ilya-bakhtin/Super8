import("..\8mm film 2048x1536 18Fps.mov.avs")
v71 = LWLibavVideoSource(source_dir + "v071f.avi", cache=false).ConvertToYV24()
#v71 = v71.crop(0, 8, 0, -4)
v71 = v71.adjustSize()
v71 = v71.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v71 = v71.colorYUV(off_u=4, off_v=-4, gamma_y=48)
return v71.prefetch(6)
#adjustframerate
