import("..\1982-skola-1-N8-film.mov.avs")
v97 = LWLibavVideoSource(source_dir + "v097f.avi", cache=false).ConvertToYV24()
v97 = v97.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v97 = v97.adjustSize
v97 = v97.assumeFPS(18)
return v97.prefetch
#adjustframerate
