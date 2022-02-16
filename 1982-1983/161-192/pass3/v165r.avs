import("..\8mm film 2048x1536 18Fps.mov.avs")
v165 = LWLibavVideoSource(source_dir + "v165f.avi", cache=false).ConvertToYV24()
v165 = v165.colorYUV(off_y=6)
v165 = v165.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v165 = v165.adjustBorders
return v165.prefetch(6)
#adjustframerate
