import("..\8mm film 2048x1536 18Fps.mov.avs")
v62 = LWLibavVideoSource(source_dir + "v62f.avi").ConvertToYV24()
#v62 = v62.crop(0, 8, 0, -4)
v62 = v62.adjustSize()
v62 = v62.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v62 = v62.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v62.prefetch(6)
#adjustframerate
