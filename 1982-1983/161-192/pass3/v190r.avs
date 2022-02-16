import("..\8mm film 2048x1536 18Fps.mov.avs")
v190 = LWLibavVideoSource(source_dir + "v190f.avi", cache=false).ConvertToYV24()
v190 = v190.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v190 = v190.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v190 = v190.colorYUV(off_u=-2, off_v=4)
v190 = v190.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v190 = v190.adjustBorders
return v190.prefetch(6)
#adjustframerate
