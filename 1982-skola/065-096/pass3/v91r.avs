import("..\1982-skola-1-N8-film.mov.avs")
v91 = LWLibavVideoSource(source_dir + "v91f.avi", cache=false).ConvertToYV24()
v91 = v91.AdjustColor(ou=0, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v91 = v91.colorYUV(off_u=-4, off_v=2)
v91 = v91.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.2)
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
return v91.prefetch
#adjustframerate
