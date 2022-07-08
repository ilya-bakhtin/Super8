import("..\1982-skola-1-N8-film.mov.avs")
v74 = LWLibavVideoSource(source_dir + "v74f.avi", cache=false).ConvertToYV24()
v74 = v74.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v74 = v74.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v74 = v74.adjustSize
v74 = v74.assumeFPS(18)
return v74.prefetch
#adjustframerate
