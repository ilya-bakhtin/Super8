import("..\1982-skola-1-N8-film.mov.avs")
v139 = LWLibavVideoSource(source_dir + "v139f.avi", cache=false).ConvertToYV24()
v139 = v139.trim(1, 0)
v139 = v139.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v139 = v139.colorYUV(off_u=-4, off_v=4)
v139 = v139.autolevels(minRng=0, ignore_low=0.003, ignore_high=0, gamma=1.1)
v139 = v139.adjustSize
v139 = v139.assumeFPS(18)
return v139.prefetch
#adjustframerate
