import("..\8mm film 2048x1536 18Fps.mov.avs")
v108 = LWLibavVideoSource(source_dir + "v108f.avi", cache=false).ConvertToYV24()
v108 = v108.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.3, hi_th=0.001, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v108 = v108.colorYUV(off_u=4, off_v=-6, gamma_y=0)
return v108.prefetch(6)
#adjustframerate
