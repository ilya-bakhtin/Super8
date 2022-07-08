import("..\1982-skola-1-N8-film.mov.avs")
v39 = LWLibavVideoSource(source_dir + "v39f.avi", cache=false).ConvertToYV24()
v39 = v39.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v39 = v39.colorYUV(off_u=-4, off_v=2)
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
return v39.prefetch
#adjustframerate
