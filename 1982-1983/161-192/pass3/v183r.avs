import("..\8mm film 2048x1536 18Fps.mov.avs")
v183 = LWLibavVideoSource(source_dir + "v183f.avi", cache=false).ConvertToYV24()
v183 = v183.AdjustColor(ou=6, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.5, red=1, grn=1, blu=1, gam_mac=true)
v183 = v183.colorYUV(off_u=-2, off_v=2)
v183 = v183.adjustBorders
return v183.prefetch(6)
#adjustframerate
