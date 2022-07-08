import("..\1982-skola-1-N8-film.mov.avs")
v70 = LWLibavVideoSource(source_dir + "v70f.avi", cache=false).ConvertToYV24()
v70 = v70.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v70 = v70.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v70 = v70.adjustSize
v70 = v70.assumeFPS(18)
return v70.prefetch
#adjustframerate
