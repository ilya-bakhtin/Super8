import("..\1982-skola-1-N8-film.mov.avs")
v135 = LWLibavVideoSource(source_dir + "v135f.avi", cache=false).ConvertToYV24()
v135 = v135.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v135 = v135.colorYUV(off_u=-4, off_v=4)
v135 = v135.adjustSize
v135 = v135.assumeFPS(18)
return v135.prefetch
#adjustframerate
