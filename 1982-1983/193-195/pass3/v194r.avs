import("..\8mm film 2048x1536 18Fps.mov.avs")
v194 = LWLibavVideoSource(source_dir + "v194f.avi", cache=false).ConvertToYV24()
v194 = v194.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v194 = v194.adjustBorders
return v194.prefetch(6)
#adjustframerate
