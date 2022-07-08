import("..\1982-skola-1-N8-film.mov.avs")
v146 = LWLibavVideoSource(source_dir + "v146f.avi", cache=false).ConvertToYV24()
v146 = v146.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v146 = v146.colorYUV(off_u=-8, off_v=0)
v146 = v146.autolevels(minRng=0, ignore_low=0.003, ignore_high=0, gamma=1.1)
v146 = v146.adjustSize
v146 = v146.assumeFPS(18)
return v146.prefetch
#adjustframerate
