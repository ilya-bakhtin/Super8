import("..\1982-skola-1-N8-film.mov.avs")
v132 = LWLibavVideoSource(source_dir + "v132f.avi", cache=false).ConvertToYV24()
v132 = v132.AdjustColor(ou=8, ov=-8, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v132 = v132.colorYUV(off_u=-4, off_v=4)
v132 = v132.adjustSize
v132 = v132.assumeFPS(18)
return v132.prefetch
#adjustframerate
