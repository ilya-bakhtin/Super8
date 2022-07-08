import("..\1982-skola-1-N8-film.mov.avs")
v72 = LWLibavVideoSource(source_dir + "v72f.avi", cache=false).ConvertToYV24()
v72 = v72.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v72 = v72.adjustSize
v72 = v72.assumeFPS(18)
return v72.prefetch
#adjustframerate
