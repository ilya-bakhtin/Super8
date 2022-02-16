import("..\8mm film 2048x1536 18Fps.mov.avs")
v174 = LWLibavVideoSource(source_dir + "v174f.avi", cache=false).ConvertToYV24()
v174 = v174.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v174 = v174.AdjustColor(ou=3, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v174 = v174.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v174 = v174.adjustBorders
return v174.prefetch(6)
#adjustframerate
