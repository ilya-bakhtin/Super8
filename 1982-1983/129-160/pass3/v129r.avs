import("..\8mm film 2048x1536 18Fps.mov.avs")
v129 = LWLibavVideoSource(source_dir + "v129f.avi", cache=false).ConvertToYV24()
v129 = v129.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v129 = v129.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v129 = v129.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v129 = v129.adjustBorders
return v129.prefetch(6)
#adjustframerate
