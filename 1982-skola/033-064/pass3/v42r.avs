import("..\1982-skola-1-N8-film.mov.avs")
v42 = LWLibavVideoSource(source_dir + "v42f.avi", cache=false).ConvertToYV24()
v42 = v42.AdjustColor(ou=0, ov=2, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v42 = v42.colorYUV(off_u=-4, off_v=0)
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
return v42.prefetch
#adjustframerate
