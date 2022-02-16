import("..\8mm film 2048x1536 18Fps.mov.avs")
v170 = LWLibavVideoSource(source_dir + "v170f.avi", cache=false).ConvertToYV24()
v170 = v170.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v170 = v170.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v170 = v170.colorYUV(off_u=-2, off_v=2)
v170 = v170.adjustBorders
return v170.prefetch(6)
#adjustframerate
