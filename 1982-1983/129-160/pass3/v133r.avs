import("..\8mm film 2048x1536 18Fps.mov.avs")
v133 = LWLibavVideoSource(source_dir + "v133f.avi", cache=false).ConvertToYV24()
v133 = v133.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v133 = v133.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v133 = v133.adjustBorders
return v133.prefetch(6)
#adjustframerate
