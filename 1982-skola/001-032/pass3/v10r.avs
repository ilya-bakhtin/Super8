import("..\1982-skola-1-N8-film.mov.avs")
v10 = LWLibavVideoSource(source_dir + "v10f.avi", cache=false).ConvertToYV24()
v10 = v10.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v10 = v10.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
return v10.prefetch
#adjustframerate
