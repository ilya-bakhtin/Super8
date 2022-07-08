import("..\1982-skola-1-N8-film.mov.avs")
v1 = LWLibavVideoSource(source_dir + "v1f.avi", cache=false).ConvertToYV24()
v1 = v1.AdjustColor(ou=0, ov=0, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v1 = v1.colorYUV(off_u=-2, off_v=4)
v1 = v1.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v1 = v1.adjustSize
v1 = v1.assumeFPS(12)
return v1.prefetch
#adjustframerate
