import("..\1982-skola-1-N8-film.mov.avs")
v19 = LWLibavVideoSource(source_dir + "v19f.avi", cache=false).ConvertToYV24()
v19 = v19.AdjustColor(ou=0, ov=0, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
return v19.prefetch
#adjustframerate
