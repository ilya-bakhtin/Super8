import("..\1982-skola-1-N8-film.mov.avs")
v144 = LWLibavVideoSource(source_dir + "v144f.avi", cache=false).ConvertToYV24()
v144 = v144.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v144 = v144.colorYUV(off_u=-4, off_v=4)
v144 = v144.adjustSize
v144 = v144.assumeFPS(18)
return v144.prefetch
#adjustframerate
