import("..\1982-skola-1-N8-film.mov.avs")
v98 = LWLibavVideoSource(source_dir + "v098f.avi", cache=false).ConvertToYV24()
v98 = v98.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v98 = v98.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v98 = v98.adjustSize
v98 = v98.assumeFPS(18)
return v98.prefetch
#adjustframerate
