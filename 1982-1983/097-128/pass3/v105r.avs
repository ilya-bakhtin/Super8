import("..\8mm film 2048x1536 18Fps.mov.avs")
v105 = LWLibavVideoSource(source_dir + "v105f.avi", cache=false).ConvertToYV24()
v105 = v105.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v105 = v105.colorYUV(off_u=8, off_v=-6, gamma_y=0)
return v105.prefetch(6)
#adjustframerate
