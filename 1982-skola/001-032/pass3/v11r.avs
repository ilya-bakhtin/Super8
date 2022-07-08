import("..\1982-skola-1-N8-film.mov.avs")
v11 = LWLibavVideoSource(source_dir + "v11f.avi", cache=false).ConvertToYV24()
v11 = v11.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v11 = v11.adjustSize
v11 = v11.assumeFPS(18)
return v11.prefetch
#adjustframerate
