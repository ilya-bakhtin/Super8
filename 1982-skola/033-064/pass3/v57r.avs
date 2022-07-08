import("..\1982-skola-1-N8-film.mov.avs")
v57 = LWLibavVideoSource(source_dir + "v57f.avi", cache=false).ConvertToYV24()
v57 = v57.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v57 = v57.colorYUV(off_u=-4, off_v=4)
v57 = v57.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v57 = v57.adjustSize
v57 = v57.assumeFPS(18)
return v57.prefetch
#adjustframerate
