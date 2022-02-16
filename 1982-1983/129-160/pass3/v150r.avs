import("..\8mm film 2048x1536 18Fps.mov.avs")
v150 = LWLibavVideoSource(source_dir + "v150f.avi", cache=false).ConvertToYV24()
v150 = v150.colorYUV(off_y=6)
v150 = v150.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v150 = v150.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v150 = v150.adjustBorders
return v150.prefetch(6)
#adjustframerate
