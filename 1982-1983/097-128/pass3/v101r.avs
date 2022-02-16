import("..\8mm film 2048x1536 18Fps.mov.avs")
v101 = LWLibavVideoSource(source_dir + "v101f.avi", cache=false).ConvertToYV24()
v101 = v101.AdjustColor(ou=-4, ov=2, x=10, y=200, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v101 = v101.colorYUV(off_u=-4, off_v=0, gamma_y=16)
return v101.prefetch(6)
#adjustframerate
