import("..\8mm film 2048x1536 18Fps.mov.avs")
v90 = LWLibavVideoSource(source_dir + "v090f.avi", cache=false).ConvertToYV24()
#v90 = v90.crop(0, 8, 0, -4)
v90 = v90.adjustSize()
v90 = v90.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v90 = v90.adjustBorders
return v90.prefetch(6)
#adjustframerate
