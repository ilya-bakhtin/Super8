import("..\8mm film 2048x1536 18Fps.mov.avs")
v161 = LWLibavVideoSource(source_dir + "v161f.avi", cache=false).ConvertToYV24()
v161 = v161.colorYUV(off_y=4)
v161 = v161.AdjustColor(ou=2, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v161 = v161.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.7)
v161 = v161.adjustBorders
return v161.prefetch(6)
#adjustframerate
