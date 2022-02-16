import("..\8mm film 2048x1536 18Fps.mov.avs")
v88 = LWLibavVideoSource(source_dir + "v088f.avi", cache=false).ConvertToYV24()
#v88 = v88.crop(0, 8, 0, -4)
v88 = v88.adjustSize()
v88 = v88.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v88 = v88.adjustBorders
return v88.prefetch(6)
#adjustframerate
