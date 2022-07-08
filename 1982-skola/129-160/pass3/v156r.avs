import("..\1982-skola-1-N8-film.mov.avs")
v156 = LWLibavVideoSource(source_dir + "v156f.avi", cache=false).ConvertToYV24()
v156 = v156.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v156 = v156.adjustSize
v156 = v156.assumeFPS(18)
return v156.prefetch
#adjustframerate
