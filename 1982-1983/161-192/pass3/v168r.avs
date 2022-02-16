import("..\8mm film 2048x1536 18Fps.mov.avs")
v168 = LWLibavVideoSource(source_dir + "v168f.avi", cache=false).ConvertToYV24()
v168 = v168.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v168 = v168.AdjustColor(ou=0, ov=-3, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v168 = v168.colorYUV(off_u=-2, off_v=2)
v168 = v168.adjustBorders
return v168.prefetch(6)
#adjustframerate
