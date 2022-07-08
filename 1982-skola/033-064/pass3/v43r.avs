import("..\1982-skola-1-N8-film.mov.avs")
v43 = LWLibavVideoSource(source_dir + "v43f.avi", cache=false).ConvertToYV24()
v43 = v43.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v43 = v43.colorYUV(off_u=-4, off_v=0)
v43 = v43.adjustSize
v43 = v43.assumeFPS(18)
return v43.prefetch
#adjustframerate
