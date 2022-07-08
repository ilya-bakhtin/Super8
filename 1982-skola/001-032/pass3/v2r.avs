import("..\1982-skola-1-N8-film.mov.avs")
v2 = LWLibavVideoSource(source_dir + "v2f.avi", cache=false).ConvertToYV24()
v2 = v2.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v2 = v2.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v2 = v2.adjustSize
v2 = v2.assumeFPS(18)
return v2.prefetch
#adjustframerate
