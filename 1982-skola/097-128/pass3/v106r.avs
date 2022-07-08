import("..\1982-skola-1-N8-film.mov.avs")
v106 = LWLibavVideoSource(source_dir + "v106f.avi", cache=false).ConvertToYV24()
v106 = v106.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v106 = v106.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v106 = v106.adjustSize
v106 = v106.assumeFPS(18)
return v106.prefetch
#adjustframerate
