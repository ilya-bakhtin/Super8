import("..\1982-skola-1-N8-film.mov.avs")
v67 = LWLibavVideoSource(source_dir + "v67f.avi", cache=false).ConvertToYV24()
v67 = v67.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v67 = v67.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v67 = v67.adjustSize
v67 = v67.assumeFPS(18)
return v67.prefetch
#adjustframerate
