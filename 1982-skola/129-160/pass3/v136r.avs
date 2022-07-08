import("..\1982-skola-1-N8-film.mov.avs")
v136 = LWLibavVideoSource(source_dir + "v136f.avi", cache=false).ConvertToYV24()
v136 = v136.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v136 = v136.adjustSize
v136 = v136.assumeFPS(18)
return v136.prefetch
#adjustframerate
