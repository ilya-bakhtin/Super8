import("..\8mm film 2048x1536 18Fps.mov.avs")
v143 = LWLibavVideoSource(source_dir + "v143f.avi", cache=false).ConvertToYV24()
v143 = v143.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v143 = v143.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v143 = v143.colorYUV(off_u=-2, off_v=2)
v143 = v143.adjustBorders
return v143.prefetch(6)
#adjustframerate
