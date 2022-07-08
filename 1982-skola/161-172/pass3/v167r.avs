import("..\1982-skola-1-N8-film.mov.avs")
v167 = LWLibavVideoSource(source_dir + "v167f.avi", cache=false).ConvertToYV24()
v167 = v167.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v167 = v167.colorYUV(off_u=-8, off_v=0)
v167 = v167.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.8)
v167 = v167.adjustSize
v167 = v167.assumeFPS(18)
return v167.prefetch
#adjustframerate
