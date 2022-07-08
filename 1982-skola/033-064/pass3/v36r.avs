import("..\1982-skola-1-N8-film.mov.avs")
v36 = LWLibavVideoSource(source_dir + "v36f.avi", cache=false).ConvertToYV24()
v36 = v36.AdjustColor(ou=-2, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v36 = v36.colorYUV(off_u=-4, off_v=2)
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
return v36.prefetch
#adjustframerate
