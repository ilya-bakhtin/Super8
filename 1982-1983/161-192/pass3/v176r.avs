import("..\8mm film 2048x1536 18Fps.mov.avs")
v176 = LWLibavVideoSource(source_dir + "v176f.avi", cache=false).ConvertToYV24()
v176 = v176.colorYUV(off_y=6)
v176 = v176.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v176 = v176.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.7)
v176 = v176.adjustBorders
return v176.prefetch(6)
#adjustframerate
