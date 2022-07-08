import("..\1982-skola-1-N8-film.mov.avs")
v142 = LWLibavVideoSource(source_dir + "v142f.avi", cache=false).ConvertToYV24()
v142 = v142.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v142 = v142.colorYUV(off_u=-4, off_v=4)
v142 = v142.autolevels(minRng=0, ignore_low=0.003, ignore_high=0, gamma=1.1)
v142 = v142.adjustSize
v142 = v142.assumeFPS(18)
return v142.prefetch
#adjustframerate
