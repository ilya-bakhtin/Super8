import("..\8mm film 2048x1536 18Fps.mov.avs")
v77 = LWLibavVideoSource(source_dir + "v077f.avi", cache=false).ConvertToYV24()
#v77 = v77.crop(0, 8, 0, -4)
v77 = v77.adjustSize()
v77 = v77.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v77 = v77.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v77.prefetch(6)
#adjustframerate
