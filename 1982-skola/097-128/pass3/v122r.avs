import("..\1982-skola-1-N8-film.mov.avs")
v122 = LWLibavVideoSource(source_dir + "v122f.avi", cache=false).ConvertToYV24()
v122 = v122.AdjustColor(ou=4, ov=-2, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v122 = v122.adjustSize
v122 = v122.assumeFPS(18)
return v122.prefetch
#adjustframerate
