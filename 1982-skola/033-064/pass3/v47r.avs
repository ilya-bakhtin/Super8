import("..\1982-skola-1-N8-film.mov.avs")
v47 = LWLibavVideoSource(source_dir + "v47f.avi", cache=false).ConvertToYV24()
v47 = v47.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v47 = v47.colorYUV(off_u=-4, off_v=0)
v47 = v47.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
return v47.prefetch
#adjustframerate
