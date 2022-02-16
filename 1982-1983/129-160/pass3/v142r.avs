import("..\8mm film 2048x1536 18Fps.mov.avs")
v142 = LWLibavVideoSource(source_dir + "v142f.avi", cache=false).ConvertToYV24()
v142 = v142.colorYUV(off_y=12)
v142 = v142.AdjustColor(ou=6, ov=-3, x=500, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v142 = v142.colorYUV(off_u=-2, off_v=2)
v142 = v142.adjustBorders
return v142.prefetch(6)
#adjustframerate
