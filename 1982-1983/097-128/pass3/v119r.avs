import("..\8mm film 2048x1536 18Fps.mov.avs")
v119 = LWLibavVideoSource(source_dir + "v119f.avi", cache=false).ConvertToYV24()
v119 = v119.autolevels(minRng=0, gamma=0.2)
v119 = v119.AdjustColor(ou=10, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
return v119.prefetch(6)
#adjustframerate
