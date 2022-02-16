import("..\8mm film 2048x1536 18Fps.mov.avs")
v126 = LWLibavVideoSource(source_dir + "v126f.avi", cache=false).ConvertToYV24()
v126 = v126.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v126 = v126.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v126 = v126.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v126.prefetch(6)
#adjustframerate
