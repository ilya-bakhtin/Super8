import("..\8mm film 2048x1536 18Fps.mov.avs")
v29 = LWLibavVideoSource(source_dir + "v29f.avi").ConvertToYV24()
v29 = v29.crop(4, 12, 0, 0)
v29 = v29.adjustSize()
v29 = v29.AdjustColor(ou=8, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2.5, red=0.9, grn=1.04, blu=0.95, gam_mac=true)
#v29 = v29.colorYUV(off_u=6, off_v=-6, gamma_y = 0)
return v29.prefetch(6)
#adjustframerate
