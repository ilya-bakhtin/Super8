import("..\1982-skola-1-N8-film.mov.avs")
v164 = LWLibavVideoSource(source_dir + "v164f.avi", cache=false).ConvertToYV24()
v164 = v164.AdjustColor(ou=10, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v164 = v164.colorYUV(off_u=-4, off_v=4)
v164 = v164.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v164 = v164.adjustSize
v164 = v164.assumeFPS(18)
return v164.prefetch
#adjustframerate
