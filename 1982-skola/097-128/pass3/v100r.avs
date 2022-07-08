import("..\1982-skola-1-N8-film.mov.avs")
v100 = LWLibavVideoSource(source_dir + "v100f.avi", cache=false).ConvertToYV24()
v100 = v100.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v100 = v100.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
return v100.prefetch
#adjustframerate
