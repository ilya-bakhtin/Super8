import("..\8mm film 2048x1536 18Fps.mov.avs")
v59 = LWLibavVideoSource(source_dir + "v59f.avi").ConvertToYV24()
#v59 = v59.crop(0, 8, 0, -4)
v59 = v59.adjustSize()
v59 = v59.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v59 = v59.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v59.prefetch(6)
#adjustframerate
