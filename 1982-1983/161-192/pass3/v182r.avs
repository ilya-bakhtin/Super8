import("..\8mm film 2048x1536 18Fps.mov.avs")
v182 = LWLibavVideoSource(source_dir + "v182f.avi", cache=false).ConvertToYV24()
v182 = v182.colorYUV(off_y=6)
v182 = v182.AdjustColor(ou=6, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v182 = v182.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v182 = v182.adjustBorders
return v182.prefetch(6)
#adjustframerate
