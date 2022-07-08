import("..\1982-skola-1-N8-film.mov.avs")
v153 = LWLibavVideoSource(source_dir + "v153f.avi", cache=false).ConvertToYV24()
v153 = v153.AdjustColor(ou=10, ov=-6, x=500, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v153 = v153.colorYUV(off_u=-4, off_v=4)
v153 = v153.adjustSize
v153 = v153.assumeFPS(18)
return v153.prefetch
#adjustframerate
