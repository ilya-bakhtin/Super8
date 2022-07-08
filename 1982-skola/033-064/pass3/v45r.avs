import("..\1982-skola-1-N8-film.mov.avs")
v45 = LWLibavVideoSource(source_dir + "v45f.avi", cache=false).ConvertToYV24()
v45 = v45.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v45 = v45.colorYUV(off_u=-4, off_v=4)
v45 = v45.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v45 = v45.adjustSize
v45 = v45.assumeFPS(18)
return v45.prefetch
#adjustframerate
