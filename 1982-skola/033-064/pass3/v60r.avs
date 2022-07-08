import("..\1982-skola-1-N8-film.mov.avs")
v60 = LWLibavVideoSource(source_dir + "v60f.avi", cache=false).ConvertToYV24()
v60 = v60.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v60 = v60.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.4)
v60 = v60.adjustSize
v60 = v60.assumeFPS(18)
return v60.prefetch
#adjustframerate
