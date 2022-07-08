import("..\1982-skola-1-N8-film.mov.avs")
v155 = LWLibavVideoSource(source_dir + "v155f.avi", cache=false).ConvertToYV24()
v155 = v155.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v155 = v155.adjustSize
v155 = v155.assumeFPS(18)
return v155.prefetch
#adjustframerate
