import("..\8mm film 2048x1536 18Fps.mov.avs")
v141 = LWLibavVideoSource(source_dir + "v141f.avi", cache=false).ConvertToYV24()
v141 = v141.colorYUV(off_y=12)
v141 = v141.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v141 = v141.adjustBorders
return v141.prefetch(6)
#adjustframerate
