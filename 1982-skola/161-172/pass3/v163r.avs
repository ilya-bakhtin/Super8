import("..\1982-skola-1-N8-film.mov.avs")
v163 = LWLibavVideoSource(source_dir + "v163f.avi", cache=false).ConvertToYV24()
v163 = v163.AdjustColor(ou=10, ov=-6, x=300, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=1, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v163 = v163.colorYUV(off_u=-4, off_v=4)
v163 = v163.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=0.7)
v163 = v163.adjustSize
v163 = v163.assumeFPS(18)
return v163.prefetch
#adjustframerate
