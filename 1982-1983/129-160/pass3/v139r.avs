import("..\8mm film 2048x1536 18Fps.mov.avs")
v139 = LWLibavVideoSource(source_dir + "v139f.avi", cache=false).ConvertToYV24()
v139 = v139.colorYUV(off_y=6)
v139 = v139.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v139 = v139.adjustBorders
return v139.prefetch(6)
#adjustframerate
