import("..\1982-skola-1-N8-film.mov.avs")
v92 = LWLibavVideoSource(source_dir + "v92f.avi", cache=false).ConvertToYV24()
v92 = v92.AdjustColor(ou=0, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v92 = v92.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
return v92.prefetch
#adjustframerate
