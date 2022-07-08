import("..\1982-skola-1-N8-film.mov.avs")
v147 = LWLibavVideoSource(source_dir + "v147f.avi", cache=false).ConvertToYV24()
v147 = v147.AdjustColor(ou=10, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v147 = v147.colorYUV(off_u=-8, off_v=0)
v147 = v147.adjustSize
v147 = v147.assumeFPS(18)
return v147.prefetch
#adjustframerate
