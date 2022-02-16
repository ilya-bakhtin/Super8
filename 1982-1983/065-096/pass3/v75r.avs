import("..\8mm film 2048x1536 18Fps.mov.avs")
v75 = LWLibavVideoSource(source_dir + "v075f.avi", cache=false).ConvertToYV24()
#v75 = v75.crop(0, 8, 0, -4)
v75 = v75.adjustSize()
v75 = v75.AdjustColor(ou=-0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v75 = v75.colorYUV(off_u=0, off_v=-4, gamma_y=0)
return v75.prefetch(6)
#adjustframerate
