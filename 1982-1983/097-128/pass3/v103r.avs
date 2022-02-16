import("..\8mm film 2048x1536 18Fps.mov.avs")
v103 = LWLibavVideoSource(source_dir + "v103f.avi", cache=false).ConvertToYV24()
v103 = v103.colorYUV(off_y=-20)
v103 = v103.AdjustColor(ou=-4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v103 = v103.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v103.prefetch(6)
#adjustframerate
