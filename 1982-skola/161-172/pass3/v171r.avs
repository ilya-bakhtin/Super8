import("..\1982-skola-1-N8-film.mov.avs")
v171 = LWLibavVideoSource(source_dir + "v171f.avi", cache=false).ConvertToYV24()
v171 = v171.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v171 = v171.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v171 = v171.adjustSize
v171 = v171.assumeFPS(18)
return v171.prefetch
#adjustframerate
