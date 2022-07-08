import("..\1982-skola-1-N8-film.mov.avs")
v85 = LWLibavVideoSource(source_dir + "v85f.avi", cache=false).ConvertToYV24()
v85 = v85.AdjustColor(ou=2, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v85 = v85.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v85 = v85.adjustSize
v85 = v85.assumeFPS(18)
return v85.prefetch
#adjustframerate
