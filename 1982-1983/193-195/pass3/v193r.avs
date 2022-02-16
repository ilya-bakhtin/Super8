import("..\8mm film 2048x1536 18Fps.mov.avs")
v193 = LWLibavVideoSource(source_dir + "v193f.avi", cache=false).ConvertToYV24()
v193 = v193.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v193 = v193.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v193 = v193.adjustBorders
return v193.prefetch(6)
#adjustframerate
