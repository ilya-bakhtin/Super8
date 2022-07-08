import("..\1982-skola-1-N8-film.mov.avs")
v30 = LWLibavVideoSource(source_dir + "v30f.avi", cache=false).ConvertToYV24()
v30 = v30.AdjustColor(ou=0, ov=0, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v30 = v30.adjustSize
v30 = v30.assumeFPS(18)
return v30.prefetch
#adjustframerate
