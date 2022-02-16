import("..\8mm film 2048x1536 18Fps.mov.avs")
v110 = LWLibavVideoSource(source_dir + "v110f.avi", cache=false).ConvertToYV24()
v110 = v110.autolevels
v110 = v110.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v110 = v110.colorYUV(off_u=2, off_v=-4, gamma_y=0)
return v110.prefetch(6)
#adjustframerate
