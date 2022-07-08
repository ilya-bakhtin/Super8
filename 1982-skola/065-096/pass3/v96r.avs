import("..\1982-skola-1-N8-film.mov.avs")
v96 = LWLibavVideoSource(source_dir + "v96f.avi", cache=false).ConvertToYV24()
#v96_ = LWLibavVideoSource(source_dir + "v96s.avi", cache=false).ConvertToYV24()
#return v96_.interleave(v96).histogram("levels")
#v96 = v96.colorYUV(off_y=6)
#v96 = v96.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v96 = v96.AdjustColor(ou=0, ov=0, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
#v96 = v96.colorYUV(off_u=-4, off_v=2)
v96 = v96.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
#return v96.histogram("levels").prefetch
v96 = v96.adjustSize
v96 = v96.assumeFPS(18)
return v96.prefetch
#adjustframerate
