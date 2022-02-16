import("..\8mm film 2048x1536 18Fps.mov.avs")
v120 = LWLibavVideoSource(source_dir + "v120f.avi", cache=false).ConvertToYV24()
v120 = v120.autolevels(minRng=0, gamma=0.15)
#v120 = v120.ColorYUV(autowhite=true)
#v120 = v120.tweak(sat=2, coring=false)
v120 = v120.AdjustColor(ou=10, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v120 = v120.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v120.prefetch(6)
#adjustframerate
