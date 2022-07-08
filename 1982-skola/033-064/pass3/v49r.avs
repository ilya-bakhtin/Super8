import("..\1982-skola-1-N8-film.mov.avs")
v49 = LWLibavVideoSource(source_dir + "v49f.avi", cache=false).ConvertToYV24()
v49 = v49.AdjustColor(ou=2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v49 = v49.colorYUV(off_u=-8, off_v=-2)
v49 = v49.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
return v49.prefetch
#adjustframerate
