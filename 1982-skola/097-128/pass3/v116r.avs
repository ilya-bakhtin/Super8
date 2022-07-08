import("..\1982-skola-1-N8-film.mov.avs")
v116 = LWLibavVideoSource(source_dir + "v116f.avi", cache=false).ConvertToYV24()
v116 = v116.AdjustColor(ou=4, ov=-6, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v116 = v116.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v116 = v116.adjustSize
v116 = v116.assumeFPS(18)
return v116.prefetch
#adjustframerate
