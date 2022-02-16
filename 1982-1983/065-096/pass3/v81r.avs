import("..\8mm film 2048x1536 18Fps.mov.avs")
v81 = LWLibavVideoSource(source_dir + "v081f.avi", cache=false).ConvertToYV24()
#v81 = v81.crop(0, 8, 0, -4)
v81 = v81.adjustSize()
v81 = v81.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v81 = v81.colorYUV(off_u=4, off_v=-4, gamma_y=16)
return v81.prefetch(6)
#adjustframerate
