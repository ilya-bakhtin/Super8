import("..\1982-skola-1-N8-film.mov.avs")
v93 = LWLibavVideoSource(source_dir + "v93f.avi", cache=false).ConvertToYV24()
v93 = v93.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v93 = v93.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
return v93.prefetch
#adjustframerate
