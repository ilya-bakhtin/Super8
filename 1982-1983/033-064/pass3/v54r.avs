import("..\8mm film 2048x1536 18Fps.mov.avs")
v54 = LWLibavVideoSource(source_dir + "v54f.avi").ConvertToYV24()
#v54 = v54.crop(0, 8, 0, -4)
v54 = v54.adjustSize()
v54 = v54.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v54 = v54.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v54.prefetch(6)
#adjustframerate
