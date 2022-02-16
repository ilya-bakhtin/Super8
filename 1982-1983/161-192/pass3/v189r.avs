import("..\8mm film 2048x1536 18Fps.mov.avs")
v189 = LWLibavVideoSource(source_dir + "v189f.avi", cache=false).ConvertToYV24()
v189 = v189.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v189 = v189.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v189 = v189.colorYUV(off_u=-2, off_v=4)
v189 = v189.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v189 = v189.adjustBorders
return v189.prefetch(6)
#adjustframerate
