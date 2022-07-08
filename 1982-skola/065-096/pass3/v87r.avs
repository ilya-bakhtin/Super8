import("..\1982-skola-1-N8-film.mov.avs")
v87 = LWLibavVideoSource(source_dir + "v87f.avi", cache=false).ConvertToYV24()
v87 = v87.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v87 = v87.colorYUV(off_u=-4, off_v=2)
v87 = v87.adjustSize
v87 = v87.assumeFPS(18)
return v87.prefetch
#adjustframerate
