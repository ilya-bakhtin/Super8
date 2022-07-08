import("..\1982-skola-1-N8-film.mov.avs")
v128 = LWLibavVideoSource(source_dir + "v128f.avi", cache=false).ConvertToYV24()
#v128_ = LWLibavVideoSource(source_dir + "v128s.avi", cache=false).ConvertToYV24()
#return v128_.interleave(v128).histogram("levels")
#v128 = v128.colorYUV(off_y=6)
#v128 = v128.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v128 = v128.AdjustColor(ou=6, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
#v128 = v128.colorYUV(off_u=-6, off_v=0)
#v128 = v128.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=0.8)
#return v128.histogram("levels").prefetch
v128 = v128.adjustSize
v128 = v128.assumeFPS(18)
return v128.prefetch
#adjustframerate
