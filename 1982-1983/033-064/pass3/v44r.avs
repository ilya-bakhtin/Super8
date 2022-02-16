import("..\8mm film 2048x1536 18Fps.mov.avs")
v44 = LWLibavVideoSource(source_dir + "v44f.avi").ConvertToYV24()
#v44 = v44.crop(0, 12, 0, -4)
v44 = v44.adjustSize()
v44 = v44.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v44 = v44.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v44.prefetch(6)
#adjustframerate
