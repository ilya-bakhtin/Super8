import("..\8mm film 2048x1536 18Fps.mov.avs")
v70 = LWLibavVideoSource(source_dir + "v070f.avi", cache=false).ConvertToYV24()
#v70 = v70.crop(0, 8, 0, -4)
v70 = v70.adjustSize()
v70 = v70.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v70 = v70.colorYUV(off_u=2, off_v=-2, gamma_y=64)
return v70.prefetch(6)
#adjustframerate
