import("..\8mm film 2048x1536 18Fps.mov.avs")
v131 = LWLibavVideoSource(source_dir + "v131f.avi", cache=false).ConvertToYV24()
v131 = v131.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v131 = v131.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v131 = v131.colorYUV(off_u=-4, off_v=-4)
v131 = v131.adjustBorders
return v131.prefetch(6)
#adjustframerate
