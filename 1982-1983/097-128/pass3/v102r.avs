import("..\8mm film 2048x1536 18Fps.mov.avs")
v102 = LWLibavVideoSource(source_dir + "v102f.avi", cache=false).ConvertToYV24()
v102 = v102.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v102 = v102.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v102.prefetch(6)
#adjustframerate
