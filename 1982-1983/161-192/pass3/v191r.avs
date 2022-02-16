import("..\8mm film 2048x1536 18Fps.mov.avs")
v191 = LWLibavVideoSource(source_dir + "v191f.avi", cache=false).ConvertToYV24()
v191 = v191.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v191 = v191.colorYUV(off_u=-2, off_v=4)
v191 = v191.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v191 = v191.adjustBorders
return v191.prefetch(6)
#adjustframerate
