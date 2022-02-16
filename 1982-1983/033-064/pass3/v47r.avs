import("..\8mm film 2048x1536 18Fps.mov.avs")
v47 = LWLibavVideoSource(source_dir + "v47f.avi").ConvertToYV24()
#v47 = v47.crop(0, 12, 0, -4)
v47 = v47.adjustSize()
v47 = v47.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v47 = v47.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v47.prefetch(6)
#adjustframerate
