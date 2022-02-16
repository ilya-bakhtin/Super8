import("..\8mm film 2048x1536 18Fps.mov.avs")
v162 = LWLibavVideoSource(source_dir + "v162f.avi", cache=false).ConvertToYV24()
v162 = v162.AdjustColor(ou=-3, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v162 = v162.adjustBorders
return v162.prefetch(6)
#adjustframerate
