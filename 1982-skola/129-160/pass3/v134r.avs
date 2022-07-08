import("..\1982-skola-1-N8-film.mov.avs")
v134 = LWLibavVideoSource(source_dir + "v134f.avi", cache=false).ConvertToYV24()
v134 = v134.AdjustColor(ou=8, ov=-4, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v134 = v134.colorYUV(off_u=-4, off_v=4)
v134 = v134.adjustSize
v134 = v134.assumeFPS(18)
return v134.prefetch
#adjustframerate
