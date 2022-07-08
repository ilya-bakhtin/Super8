import("..\1982-skola-1-N8-film.mov.avs")
v50 = LWLibavVideoSource(source_dir + "v50f.avi", cache=false).ConvertToYV24()
v50 = v50.AdjustColor(ou=2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v50 = v50.colorYUV(off_u=-8, off_v=2)
v50 = v50.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
return v50.prefetch
#adjustframerate
