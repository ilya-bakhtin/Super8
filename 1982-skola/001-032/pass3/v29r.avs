import("..\1982-skola-1-N8-film.mov.avs")
v29 = LWLibavVideoSource(source_dir + "v29f.avi", cache=false).ConvertToYV24()
v29 = v29.AdjustColor(ou=0, ov=0, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v29 = v29.adjustSize
v29 = v29.assumeFPS(18)
return v29.prefetch
#adjustframerate
