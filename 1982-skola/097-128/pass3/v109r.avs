import("..\1982-skola-1-N8-film.mov.avs")
v109 = LWLibavVideoSource(source_dir + "v109f.avi", cache=false).ConvertToYV24()
v109 = v109.AdjustColor(ou=4, ov=-4, x=100, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v109 = v109.colorYUV(off_u=-6, off_v=0)
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
return v109.prefetch
#adjustframerate
