import("..\1982-skola-1-N8-film.mov.avs")
v124 = LWLibavVideoSource(source_dir + "v124f.avi", cache=false).ConvertToYV24()
v124 = v124.AdjustColor(ou=4, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v124 = v124.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
v124 = v124.adjustSize
v124 = v124.assumeFPS(18)
return v124.prefetch
#adjustframerate
