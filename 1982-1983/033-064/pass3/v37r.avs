import("..\8mm film 2048x1536 18Fps.mov.avs")
v37 = LWLibavVideoSource(source_dir + "v37f.avi").ConvertToYV24()
#v37 = v37.crop(0, 12, 0, -4)
v37 = v37.adjustSize()
v37 = v37.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v37 = v37.colorYUV(off_u=0, off_v=0, gamma_y = 64)
return v37.prefetch(6)
#adjustframerate
