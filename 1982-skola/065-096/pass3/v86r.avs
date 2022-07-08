import("..\1982-skola-1-N8-film.mov.avs")
v86 = LWLibavVideoSource(source_dir + "v86f.avi", cache=false).ConvertToYV24()
v86 = v86.AdjustColor(ou=0, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.7, red=1, grn=1, blu=1, gam_mac=true)
v86 = v86.colorYUV(off_u=-4, off_v=0)
v86 = v86.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.1)
v86 = v86.adjustSize
v86 = v86.assumeFPS(18)
return v86.prefetch
#adjustframerate
