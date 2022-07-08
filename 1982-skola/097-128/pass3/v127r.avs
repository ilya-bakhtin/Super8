import("..\1982-skola-1-N8-film.mov.avs")
v127 = LWLibavVideoSource(source_dir + "v127f.avi", cache=false).ConvertToYV24()
v127 = v127.AdjustColor(ou=4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v127 = v127.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v127 = v127.adjustSize
v127 = v127.assumeFPS(18)
return v127.prefetch
#adjustframerate
