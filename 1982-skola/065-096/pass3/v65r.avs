import("..\1982-skola-1-N8-film.mov.avs")
v65 = LWLibavVideoSource(source_dir + "v65f.avi", cache=false).ConvertToYV24()
v65 = v65.AdjustColor(ou=0, ov=-4, x=200, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.3, red=1, grn=1, blu=1, gam_mac=true)
v65 = v65.colorYUV(off_u=-4, off_v=4)
v65 = v65.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
v65 = v65.adjustSize
v65 = v65.assumeFPS(18)
return v65.prefetch
#adjustframerate
