import("..\8mm film 2048x1536 18Fps.mov.avs")
v138 = LWLibavVideoSource(source_dir + "v138f.avi", cache=false).ConvertToYV24()
v138 = v138.colorYUV(off_y=6)
v138 = v138.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v138 = v138.colorYUV(off_u=-4, off_v=0)
v138 = v138.adjustBorders
return v138.prefetch(6)
#adjustframerate
