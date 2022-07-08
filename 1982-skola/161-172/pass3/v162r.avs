import("..\1982-skola-1-N8-film.mov.avs")
v162 = LWLibavVideoSource(source_dir + "v162f.avi", cache=false).ConvertToYV24()
v162 = v162.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v162 = v162.colorYUV(off_u=-4, off_v=4)
v162 = v162.adjustSize
v162 = v162.assumeFPS(18)
return v162.prefetch
#adjustframerate
