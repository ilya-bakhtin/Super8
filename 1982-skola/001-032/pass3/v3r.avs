import("..\1982-skola-1-N8-film.mov.avs")
v3 = LWLibavVideoSource(source_dir + "v3f.avi", cache=false).ConvertToYV24()
v3 = v3.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v3 = v3.adjustSize
v3 = v3.assumeFPS(12)
return v3.prefetch
#adjustframerate
