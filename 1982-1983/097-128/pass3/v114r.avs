import("..\8mm film 2048x1536 18Fps.mov.avs")
v114 = LWLibavVideoSource(source_dir + "v114f.avi", cache=false).ConvertToYV24()
v114 = v114.autolevels
v114 = v114.AdjustColor(ou=-8, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=1.5, red=1, grn=1, blu=1, gam_mac=true)
#v114 = v114.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v114.prefetch(6)
#adjustframerate
