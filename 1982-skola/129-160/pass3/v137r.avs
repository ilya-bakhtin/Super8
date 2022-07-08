import("..\1982-skola-1-N8-film.mov.avs")
v137 = LWLibavVideoSource(source_dir + "v137f.avi", cache=false).ConvertToYV24()
v137 = v137.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v137 = v137.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v137 = v137.adjustSize
v137 = v137.assumeFPS(18)
return v137.prefetch
#adjustframerate
