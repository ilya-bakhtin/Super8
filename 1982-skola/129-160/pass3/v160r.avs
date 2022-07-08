import("..\1982-skola-1-N8-film.mov.avs")
v160 = LWLibavVideoSource(source_dir + "v160f.avi", cache=false).ConvertToYV24()
#v160_ = LWLibavVideoSource(source_dir + "v160s.avi", cache=false).ConvertToYV24()
#return v160_.interleave(v160).histogram("levels")
#v160 = v160.colorYUV(off_y=6)
#v160 = v160.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v160 = v160.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
#v160 = v160.colorYUV(off_u=-4, off_v=4)
#v160 = v160.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v160 = v160.adjustSize
v160 = v160.assumeFPS(18)
#return v160.histogram("levels").prefetch
return v160.prefetch
#adjustframerate
