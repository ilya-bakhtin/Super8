import("..\8mm film 2048x1536 18Fps.mov.avs")
v96 = LWLibavVideoSource(source_dir + "v096f.avi", cache=false).ConvertToYV24()
#v96 = v96.crop(0, 8, 0, -4)
v96 = v96.adjustSize()
v96 = v96.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v96 = v96.colorYUV(off_u=14, off_v=-14, gamma_y=64)
#return v96.histogram("levels").prefetch(6)
#v96 = v96.adjustBorders
return v96.prefetch(6)
#adjustframerate
