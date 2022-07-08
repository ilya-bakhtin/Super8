import("..\1982-skola-1-N8-film.mov.avs")
v129 = LWLibavVideoSource(source_dir + "v129f.avi", cache=false).ConvertToYV24()
v129 = v129.AdjustColor(ou=6, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v129 = v129.colorYUV(off_u=-4, off_v=0)
v129 = v129.adjustSize
v129 = v129.assumeFPS(18)
return v129.prefetch
#adjustframerate
