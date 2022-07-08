import("..\1982-skola-1-N8-film.mov.avs")
v15 = LWLibavVideoSource(source_dir + "v15f.avi", cache=false).ConvertToYV24()
v15 = v15.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v15 = v15.adjustSize
v15 = v15.assumeFPS(18)
return v15.prefetch
#adjustframerate
