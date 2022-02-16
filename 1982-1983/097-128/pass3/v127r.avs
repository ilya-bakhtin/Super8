import("..\8mm film 2048x1536 18Fps.mov.avs")
v127 = LWLibavVideoSource(source_dir + "v127f.avi", cache=false).ConvertToYV24()
v127 = v127.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v127 = v127.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v127 = v127.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v127.prefetch(6)
#adjustframerate
