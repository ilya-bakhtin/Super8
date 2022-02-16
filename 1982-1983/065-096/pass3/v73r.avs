import("..\8mm film 2048x1536 18Fps.mov.avs")
v73 = LWLibavVideoSource(source_dir + "v073f.avi", cache=false).ConvertToYV24()
#v73 = v73.crop(0, 8, 0, -4)
v73 = v73.adjustSize()
v73 = v73.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=0, sat=2.5, red=1, grn=1, blu=1, gam_mac=true)
v73 = v73.colorYUV(off_u=0, off_v=-4, gamma_y=64)
return v73.prefetch(6)
#adjustframerate
