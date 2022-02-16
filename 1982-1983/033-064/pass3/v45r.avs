import("..\8mm film 2048x1536 18Fps.mov.avs")
v45 = LWLibavVideoSource(source_dir + "v45f.avi").ConvertToYV24()
#v45 = v45.crop(0, 12, 0, -4)
v45 = v45.adjustSize()
v45 = v45.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v45 = v45.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v45.prefetch(6)
#adjustframerate
