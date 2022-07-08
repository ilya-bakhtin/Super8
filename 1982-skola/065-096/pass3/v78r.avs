import("..\1982-skola-1-N8-film.mov.avs")
v78 = LWLibavVideoSource(source_dir + "v78f.avi", cache=false).ConvertToYV24()
v78 = v78.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v78 = v78.adjustSize
v78 = v78.assumeFPS(18)
return v78.prefetch
#adjustframerate
