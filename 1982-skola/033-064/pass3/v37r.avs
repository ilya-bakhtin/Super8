import("..\1982-skola-1-N8-film.mov.avs")
v37 = LWLibavVideoSource(source_dir + "v37f.avi", cache=false).ConvertToYV24()
v37 = v37.AdjustColor(ou=2, ov=2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v37 = v37.colorYUV(off_u=-4, off_v=2)
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
return v37.prefetch
#adjustframerate
