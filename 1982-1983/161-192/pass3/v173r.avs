import("..\8mm film 2048x1536 18Fps.mov.avs")
v173 = LWLibavVideoSource(source_dir + "v173f.avi", cache=false).ConvertToYV24()
v173 = v173.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v173 = v173.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v173 = v173.adjustBorders
return v173.prefetch(6)
#adjustframerate
