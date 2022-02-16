import("..\8mm film 2048x1536 18Fps.mov.avs")
v147 = LWLibavVideoSource(source_dir + "v147f.avi", cache=false).ConvertToYV24()
v147 = v147.colorYUV(off_y=6)
v147 = v147.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v147 = v147.adjustBorders
return v147.prefetch(6)
#adjustframerate
