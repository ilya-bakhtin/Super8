import("..\1982-skola-1-N8-film.mov.avs")
v80 = LWLibavVideoSource(source_dir + "v80f.avi", cache=false).ConvertToYV24()
v80 = v80.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v80 = v80.colorYUV(off_u=0, off_v=-4)
v80 = v80.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
return v80.prefetch
#adjustframerate
