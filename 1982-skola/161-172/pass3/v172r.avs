import("..\1982-skola-1-N8-film.mov.avs")
v172 = LWLibavVideoSource(source_dir + "v172f.avi", cache=false).ConvertToYV24()
#v172_ = LWLibavVideoSource(source_dir + "v172s.avi", cache=false).ConvertToYV24()
#return v172_.interleave(v172).histogram("levels")
#v172 = v172.colorYUV(off_y=6)
#v172 = v172.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v172 = v172.AdjustColor(ou=6, ov=-6, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v172 = v172.colorYUV(off_u=-12, off_v=0)
v172 = v172.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v172 = v172.adjustSize
v172 = v172.assumeFPS(18)
#return v172.histogram("levels").prefetch
return v172.prefetch
#adjustframerate
