import("..\1982-skola-1-N8-film.mov.avs")
v35 = LWLibavVideoSource(source_dir + "v35f.avi", cache=false).ConvertToYV24()
v35 = v35.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v35 = v35.colorYUV(off_u=-4, off_v=2)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
return v35.prefetch
#adjustframerate
