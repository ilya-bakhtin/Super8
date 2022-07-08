import("..\1982-skola-1-N8-film.mov.avs")
v54 = LWLibavVideoSource(source_dir + "v54f.avi", cache=false).ConvertToYV24()
v54 = v54.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v54 = v54.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
return v54.prefetch
#adjustframerate
