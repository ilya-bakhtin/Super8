import("..\8mm film 2048x1536 18Fps.mov.avs")
v46 = LWLibavVideoSource(source_dir + "v46f.avi").ConvertToYV24()
#v46 = v46.crop(0, 12, 0, -4)
v46 = v46.adjustSize()
v46 = v46.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v46 = v46.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v46.prefetch(6)
#adjustframerate
