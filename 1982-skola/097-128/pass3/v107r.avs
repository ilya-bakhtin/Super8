import("..\1982-skola-1-N8-film.mov.avs")
v107 = LWLibavVideoSource(source_dir + "v107f.avi", cache=false).ConvertToYV24()
v107 = v107.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v107 = v107.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
return v107.prefetch
#adjustframerate
