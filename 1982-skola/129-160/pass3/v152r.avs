import("..\1982-skola-1-N8-film.mov.avs")
v152 = LWLibavVideoSource(source_dir + "v152f.avi", cache=false).ConvertToYV24()
v152 = v152.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v152 = v152.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v152 = v152.adjustSize
v152 = v152.assumeFPS(18)
return v152.prefetch
#adjustframerate
