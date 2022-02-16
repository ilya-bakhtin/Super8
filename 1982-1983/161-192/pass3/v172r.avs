import("..\8mm film 2048x1536 18Fps.mov.avs")
v172 = LWLibavVideoSource(source_dir + "v172f.avi", cache=false).ConvertToYV24()
v172 = v172.AdjustColor(ou=6, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v172 = v172.colorYUV(off_u=-2, off_v=2)
v172 = v172.adjustBorders
return v172.prefetch(6)
#adjustframerate
