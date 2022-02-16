import("..\8mm film 2048x1536 18Fps.mov.avs")
v184 = LWLibavVideoSource(source_dir + "v184f.avi", cache=false).ConvertToYV24()
v184 = v184.autolevels(minRng=0, ignore_low=0, ignore_high=0.003)
v184 = v184.AdjustColor(ou=6, ov=-1, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v184 = v184.colorYUV(off_u=-2, off_v=2)
v184 = v184.adjustBorders
return v184.prefetch(6)
#adjustframerate
