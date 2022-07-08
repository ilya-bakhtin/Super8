import("..\1982-skola-1-N8-film.mov.avs")
v41 = LWLibavVideoSource(source_dir + "v41f.avi", cache=false).ConvertToYV24()
v41 = v41.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
return v41.prefetch
#adjustframerate
