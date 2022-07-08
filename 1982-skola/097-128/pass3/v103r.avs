import("..\1982-skola-1-N8-film.mov.avs")
v103 = LWLibavVideoSource(source_dir + "v103f.avi", cache=false).ConvertToYV24()
v103 = v103.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
return v103.prefetch
#adjustframerate
