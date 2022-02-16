import("..\8mm film 2048x1536 18Fps.mov.avs")
v98 = LWLibavVideoSource(source_dir + "v098f.avi", cache=false).ConvertToYV24()
v98 = v98.colorYUV(off_y=16)
v98 = v98.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v98 = v98.colorYUV(off_u=6, off_v=-6, gamma_y=0)
v98 = v98.autolevels(gamma=1.3)
return v98.prefetch(6)
#adjustframerate
