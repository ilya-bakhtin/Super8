import("..\1982-skola-1-N8-film.mov.avs")
v44 = LWLibavVideoSource(source_dir + "v44f.avi", cache=false).ConvertToYV24()
v44 = v44.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v44 = v44.colorYUV(off_u=-4, off_v=4)
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
return v44.prefetch
#adjustframerate
