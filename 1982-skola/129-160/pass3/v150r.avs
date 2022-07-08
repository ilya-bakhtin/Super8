import("..\1982-skola-1-N8-film.mov.avs")
v150 = LWLibavVideoSource(source_dir + "v150f.avi", cache=false).ConvertToYV24()
v150 = v150.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v150 = v150.adjustSize
v150 = v150.assumeFPS(18)
return v150.prefetch
#adjustframerate
