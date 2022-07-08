import("..\1982-skola-1-N8-film.mov.avs")
v53 = LWLibavVideoSource(source_dir + "v53f.avi", cache=false).ConvertToYV24()
v53 = v53.AdjustColor(ou=-2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v53 = v53.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v53 = v53.adjustSize
v53 = v53.assumeFPS(18)
return v53.prefetch
#adjustframerate
