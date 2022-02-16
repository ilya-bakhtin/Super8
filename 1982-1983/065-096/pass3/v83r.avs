import("..\8mm film 2048x1536 18Fps.mov.avs")
v83 = LWLibavVideoSource(source_dir + "v083f.avi", cache=false).ConvertToYV24()
#v83 = v83.crop(0, 8, 0, -4)
v83 = v83.adjustSize()
v83 = v83.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v83 = v83.colorYUV(off_u=4, off_v=-8, gamma_y=0)
return v83.prefetch(6)
#adjustframerate
