import("..\8mm film 2048x1536 18Fps.mov.avs")
v136 = LWLibavVideoSource(source_dir + "v136f.avi", cache=false).ConvertToYV24()
v136 = v136.colorYUV(off_y=12)
v136 = v136.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v136 = v136.adjustBorders
return v136.prefetch(6)
#adjustframerate
