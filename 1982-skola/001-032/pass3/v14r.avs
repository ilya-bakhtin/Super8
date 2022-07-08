import("..\1982-skola-1-N8-film.mov.avs")
v14 = LWLibavVideoSource(source_dir + "v14f.avi", cache=false).ConvertToYV24()
v14 = v14.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v14 = v14.adjustSize
v14 = v14.assumeFPS(12)
return v14.prefetch
#adjustframerate
