import("..\8mm film 2048x1536 18Fps.mov.avs")
v60 = LWLibavVideoSource(source_dir + "v60f.avi").ConvertToYV24()
#v60 = v60.crop(0, 8, 0, -4)
v60 = v60.adjustSize()
v60 = v60.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v60 = v60.colorYUV(off_u=2, off_v=-2, gamma_y=0)
return v60.prefetch(6)
#adjustframerate
