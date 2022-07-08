import("..\1982-skola-1-N8-film.mov.avs")
v108 = LWLibavVideoSource(source_dir + "v108f.avi", cache=false).ConvertToYV24()
v108 = v108.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v108 = v108.animate(189, 194, "gamma", 1100, 400).trim(0, 194) +\
       v108.animate(195, 199, "gamma", 400, 1000).trim(195, 0)
v108 = v108.adjustSize
v108 = v108.assumeFPS(18)
return v108.prefetch
#adjustframerate
