import("..\8mm film 2048x1536 18Fps.mov.avs")
v58 = LWLibavVideoSource(source_dir + "v58f.avi").ConvertToYV24()
#v58 = v58.crop(0, 8, 0, -4)
v58 = v58.adjustSize()
v58 = v58.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v58 = v58.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v58.prefetch(6)
#adjustframerate
