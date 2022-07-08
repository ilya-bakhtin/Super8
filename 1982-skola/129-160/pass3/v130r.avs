import("..\1982-skola-1-N8-film.mov.avs")
v130 = LWLibavVideoSource(source_dir + "v130f.avi", cache=false).ConvertToYV24()
v130 = v130.AdjustColor(ou=8, ov=-8, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v130 = v130.colorYUV(off_u=-8, off_v=4)
v130 = v130.adjustSize
v130 = v130.assumeFPS(18)
return v130.prefetch
#adjustframerate
