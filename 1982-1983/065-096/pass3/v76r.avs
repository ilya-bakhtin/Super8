import("..\8mm film 2048x1536 18Fps.mov.avs")
v76 = LWLibavVideoSource(source_dir + "v076f.avi", cache=false).ConvertToYV24()
#v76 = v76.crop(0, 8, 0, -4)
v76 = v76.adjustSize()
v76 = v76.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v76 = v76.colorYUV(off_u=8, off_v=-8, gamma_y=48)
return v76.prefetch(6)
#adjustframerate
