import("..\1982-skola-1-N8-film.mov.avs")
v81 = LWLibavVideoSource(source_dir + "v81f.avi", cache=false).ConvertToYV24()
v81 = v81.AdjustColor(ou=2, ov=-4, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v81 = v81.colorYUV(off_u=-4, off_v=-4)
v81 = v81.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v81 = v81.adjustSize
v81 = v81.assumeFPS(18)
return v81.prefetch
#adjustframerate
