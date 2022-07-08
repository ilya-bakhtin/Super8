import("..\1982-skola-1-N8-film.mov.avs")
v58 = LWLibavVideoSource(source_dir + "v58f.avi", cache=false).ConvertToYV24()
v58 = v58.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v58 = v58.colorYUV(off_u=-4, off_v=4)
v58 = v58.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
return v58.prefetch
#adjustframerate
