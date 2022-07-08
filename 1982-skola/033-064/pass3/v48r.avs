import("..\1982-skola-1-N8-film.mov.avs")
v48 = LWLibavVideoSource(source_dir + "v48f.avi", cache=false).ConvertToYV24()
v48 = v48.AdjustColor(ou=2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v48 = v48.colorYUV(off_u=-8, off_v=2)
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
return v48.prefetch
#adjustframerate
