import("..\8mm film 2048x1536 18Fps.mov.avs")
v149 = LWLibavVideoSource(source_dir + "v149f.avi", cache=false).ConvertToYV24()
v149 = v149.colorYUV(off_y=6)
v149 = v149.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v149 = v149.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.7)
v149 = v149.adjustBorders
return v149.prefetch(6)
#adjustframerate
