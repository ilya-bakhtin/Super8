import("..\1982-skola-1-N8-film.mov.avs")
v62 = LWLibavVideoSource(source_dir + "v62f.avi", cache=false).ConvertToYV24()
v62 = v62.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v62 = v62.colorYUV(off_u=-2, off_v=-2)
v62 = v62.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v62 = v62.adjustSize
v62 = v62.assumeFPS(18)
return v62.prefetch
#adjustframerate
