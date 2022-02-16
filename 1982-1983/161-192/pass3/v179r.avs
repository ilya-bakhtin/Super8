import("..\8mm film 2048x1536 18Fps.mov.avs")
v179 = LWLibavVideoSource(source_dir + "v179f.avi", cache=false).ConvertToYV24()
v179 = v179.AdjustColor(ou=3, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v179 = v179.adjustBorders
return v179.prefetch(6)
#adjustframerate
