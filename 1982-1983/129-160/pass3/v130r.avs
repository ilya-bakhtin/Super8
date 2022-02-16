import("..\8mm film 2048x1536 18Fps.mov.avs")
v130 = LWLibavVideoSource(source_dir + "v130f.avi", cache=false).ConvertToYV24()
v130 = v130.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v130 = v130.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v130 = v130.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v130 = v130.adjustBorders
return v130.prefetch(6)
#adjustframerate
