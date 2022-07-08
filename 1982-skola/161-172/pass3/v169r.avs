import("..\1982-skola-1-N8-film.mov.avs")
v169 = LWLibavVideoSource(source_dir + "v169f.avi", cache=false).ConvertToYV24()
v169 = v169.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v169 = v169.colorYUV(off_u=-8, off_v=0)
v169 = v169.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v169 = v169.adjustSize
v169 = v169.assumeFPS(18)
return v169.prefetch
#adjustframerate
