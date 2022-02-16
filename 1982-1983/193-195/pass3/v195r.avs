import("..\8mm film 2048x1536 18Fps.mov.avs")
v195 = LWLibavVideoSource(source_dir + "v195f.avi", cache=false).ConvertToYV24()
#v195 = v195.colorYUV(off_y=6)
v195 = v195.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v195 = v195.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v195 = v195.colorYUV(off_u=-2, off_v=4)
v195 = v195.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
#return v195.histogram("levels").prefetch(6)
v195 = v195.adjustBorders
return v195.prefetch(6)
#adjustframerate
