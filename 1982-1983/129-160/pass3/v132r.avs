import("..\8mm film 2048x1536 18Fps.mov.avs")
v132 = LWLibavVideoSource(source_dir + "v132f.avi", cache=false).ConvertToYV24()
v132 = v132.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v132 = v132.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.0, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v132 = v132.colorYUV(off_u=-2, off_v=-2)
v132 = v132.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v132 = v132.adjustBorders
return v132.prefetch(6)
#adjustframerate
