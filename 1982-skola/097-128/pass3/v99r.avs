import("..\1982-skola-1-N8-film.mov.avs")
v99 = LWLibavVideoSource(source_dir + "v099f.avi", cache=false).ConvertToYV24()
v99 = v99.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v99 = v99.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v99 = v99.adjustSize
v99 = v99.assumeFPS(18)
return v99.prefetch
#adjustframerate
