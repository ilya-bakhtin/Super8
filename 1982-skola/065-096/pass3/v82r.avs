import("..\1982-skola-1-N8-film.mov.avs")
v82 = LWLibavVideoSource(source_dir + "v82f.avi", cache=false).ConvertToYV24()
v82 = v82.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v82 = v82.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
return v82.prefetch
#adjustframerate
