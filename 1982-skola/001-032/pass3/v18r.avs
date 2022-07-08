import("..\1982-skola-1-N8-film.mov.avs")
v18 = LWLibavVideoSource(source_dir + "v18f.avi", cache=false).ConvertToYV24()
v18 = v18.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v18 = v18.adjustSize
v18 = v18.assumeFPS(18)
return v18.prefetch
#adjustframerate
