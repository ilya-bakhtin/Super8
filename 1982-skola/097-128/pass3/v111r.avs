import("..\1982-skola-1-N8-film.mov.avs")
v111 = LWLibavVideoSource(source_dir + "v111f.avi", cache=false).ConvertToYV24()
v111 = v111.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v111 = v111.animate(24, 44, "gamma", 400, 1000)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
return v111.prefetch
#adjustframerate
