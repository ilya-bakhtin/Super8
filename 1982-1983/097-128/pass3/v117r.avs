import("..\8mm film 2048x1536 18Fps.mov.avs")
v117 = LWLibavVideoSource(source_dir + "v117f.avi", cache=false).ConvertToYV24()
v117 = v117.autolevels()
v117 = v117.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v117 = v117.colorYUV(off_u=4, off_v=-4, gamma_y=0)
return v117.prefetch(6)
#adjustframerate
