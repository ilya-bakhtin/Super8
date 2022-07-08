import("..\1982-skola-1-N8-film.mov.avs")
v88 = LWLibavVideoSource(source_dir + "v88f.avi", cache=false).ConvertToYV24()
v88 = v88.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v88 = v88.adjustSize
v88 = v88.assumeFPS(18)
return v88.prefetch
#adjustframerate
