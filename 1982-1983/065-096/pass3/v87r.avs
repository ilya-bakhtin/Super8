import("..\8mm film 2048x1536 18Fps.mov.avs")
v87 = LWLibavVideoSource(source_dir + "v087f.avi", cache=false).ConvertToYV24()
#v87 = v87.crop(0, 8, 0, -4)
v87 = v87.adjustSize()
v87 = v87.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v87 = v87.colorYUV(off_u=0, off_v=-6, gamma_y=16)
return v87.prefetch(6)
#adjustframerate
