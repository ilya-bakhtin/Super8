import("..\1982-skola-1-N8-film.mov.avs")
v28 = LWLibavVideoSource(source_dir + "v28f.avi", cache=false).ConvertToYV24()
v28 = v28.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
return v28.prefetch
#adjustframerate
