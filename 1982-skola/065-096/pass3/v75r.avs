import("..\1982-skola-1-N8-film.mov.avs")
v75 = LWLibavVideoSource(source_dir + "v75f.avi", cache=false).ConvertToYV24()
v75 = v75.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v75 = v75.adjustSize
v75 = v75.assumeFPS(18)
return v75.prefetch
#adjustframerate
