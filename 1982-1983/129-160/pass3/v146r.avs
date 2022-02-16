import("..\8mm film 2048x1536 18Fps.mov.avs")
v146 = LWLibavVideoSource(source_dir + "v146f.avi", cache=false).ConvertToYV24()
v146 = v146.colorYUV(off_y=6)
v146 = v146.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v146 = v146.colorYUV(off_u=-2, off_v=2)
v146 = v146.adjustBorders
return v146.prefetch(6)
#adjustframerate
