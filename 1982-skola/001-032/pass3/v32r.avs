import("..\1982-skola-1-N8-film.mov.avs")
v32 = LWLibavVideoSource(source_dir + "v32f.avi", cache=false).ConvertToYV24()
#v32 = v32.colorYUV(off_y=6)
#v32 = v32.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v32 = v32.AdjustColor(ou=0, ov=0, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
#v32 = v32.colorYUV(off_u=-2, off_v=4)
#v32 = v32.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
#return v32.histogram("levels").prefetch
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
return v32.prefetch
#adjustframerate
