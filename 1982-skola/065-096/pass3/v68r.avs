import("..\1982-skola-1-N8-film.mov.avs")
v68 = LWLibavVideoSource(source_dir + "v68f.avi", cache=false).ConvertToYV24()
v68 = v68.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v68 = v68.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v68 = v68.adjustSize
v68 = v68.assumeFPS(18)
return v68.prefetch
#adjustframerate
