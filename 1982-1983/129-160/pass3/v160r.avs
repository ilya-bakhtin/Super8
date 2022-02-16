import("..\8mm film 2048x1536 18Fps.mov.avs")
v160 = LWLibavVideoSource(source_dir + "v160f.avi", cache=false).ConvertToYV24()
#v160 = v160.colorYUV(off_y=6)
v160 = v160.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v160 = v160.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v160 = v160.colorYUV(off_u=-2, off_v=2)
#v160 = v160.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
#return v160.histogram("levels").prefetch(6)
v160 = v160.adjustBorders
return v160.prefetch(6)
#adjustframerate
