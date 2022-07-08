import("..\1982-skola-1-N8-film.mov.avs")
v119 = LWLibavVideoSource(source_dir + "v119f.avi", cache=false).ConvertToYV24()
v119 = v119.AdjustColor(ou=4, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v119 = v119.adjustSize
v119 = v119.assumeFPS(18)
return v119.prefetch
#adjustframerate
