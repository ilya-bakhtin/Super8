import("..\1982-skola-1-N8-film.mov.avs")
v79 = LWLibavVideoSource(source_dir + "v79f.avi", cache=false).ConvertToYV24()
v79 = v79.AdjustColor(ou=2, ov=-4, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
return v79.prefetch
#adjustframerate
