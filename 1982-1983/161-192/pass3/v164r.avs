import("..\8mm film 2048x1536 18Fps.mov.avs")
v164 = LWLibavVideoSource(source_dir + "v164f.avi", cache=false).ConvertToYV24()
v164 = v164.colorYUV(off_y=6)
v164 = v164.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v164 = v164.adjustBorders
return v164.prefetch(6)
#adjustframerate
