import("..\8mm film 2048x1536 18Fps.mov.avs")
v113 = LWLibavVideoSource(source_dir + "v113f.avi", cache=false).ConvertToYV24()
v113 = v113.autolevels
v113 = v113.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v113 = v113.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v113.prefetch(6)
#adjustframerate
