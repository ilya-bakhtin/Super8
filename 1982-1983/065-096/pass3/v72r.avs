import("..\8mm film 2048x1536 18Fps.mov.avs")
v72 = LWLibavVideoSource(source_dir + "v072f.avi", cache=false).ConvertToYV24()
#v72 = v72.crop(0, 8, 0, -4)
v72 = v72.adjustSize()
v72 = v72.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v72 = v72.colorYUV(off_u=0, off_v=-4, gamma_y=64)
return v72.prefetch(6)
#adjustframerate
