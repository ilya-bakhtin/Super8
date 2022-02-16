import("..\8mm film 2048x1536 18Fps.mov.avs")
v55 = LWLibavVideoSource(source_dir + "v55f.avi").ConvertToYV24()
#v55 = v55.crop(0, 8, 0, -4)
v55 = v55.adjustSize()
v55 = v55.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v55 = v55.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v55.prefetch(6)
#adjustframerate
