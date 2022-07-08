import("..\1982-skola-1-N8-film.mov.avs")
v56 = LWLibavVideoSource(source_dir + "v56f.avi", cache=false).ConvertToYV24()
v56 = v56.AdjustColor(ou=-2, ov=-2, x=800, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v56 = v56.colorYUV(off_u=-2, off_v=0)
v56 = v56.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v56 = v56.adjustSize
v56 = v56.assumeFPS(18)
return v56.prefetch
#adjustframerate
