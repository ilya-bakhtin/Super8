import("..\1982-skola-1-N8-film.mov.avs")
v148 = LWLibavVideoSource(source_dir + "v148f.avi", cache=false).ConvertToYV24()
v148 = v148.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v148 = v148.colorYUV(off_u=-8, off_v=0)
v148 = v148.adjustSize
v148 = v148.assumeFPS(18)
return v148.prefetch
#adjustframerate
