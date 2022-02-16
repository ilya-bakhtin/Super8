import("..\8mm film 2048x1536 18Fps.mov.avs")
v51 = LWLibavVideoSource(source_dir + "v51f.avi").ConvertToYV24()
v51 = v51.crop(0, 8, 0, -4)
v51 = v51.adjustSize()
v51 = v51.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v51 = v51.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v51.prefetch(6)
#adjustframerate
