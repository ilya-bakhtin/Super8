import("..\8mm film 2048x1536 18Fps.mov.avs")
v163 = LWLibavVideoSource(source_dir + "v163f.avi", cache=false).ConvertToYV24()
v163 = v163.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v163 = v163.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v163 = v163.adjustBorders
return v163.prefetch(6)
#adjustframerate
