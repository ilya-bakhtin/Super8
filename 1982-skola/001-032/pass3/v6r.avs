import("..\1982-skola-1-N8-film.mov.avs")
v6 = LWLibavVideoSource(source_dir + "v6f.avi", cache=false).ConvertToYV24()
v6 = v6.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v6 = v6.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
return v6.prefetch
#adjustframerate
