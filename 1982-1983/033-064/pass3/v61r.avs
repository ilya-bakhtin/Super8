import("..\8mm film 2048x1536 18Fps.mov.avs")
v61 = LWLibavVideoSource(source_dir + "v61f.avi").ConvertToYV24()
#v61 = v61.crop(0, 8, 0, -4)
v61 = v61.adjustSize()
v61 = v61.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v61 = v61.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v61.prefetch(6)
#adjustframerate
