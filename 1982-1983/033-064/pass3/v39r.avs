import("..\8mm film 2048x1536 18Fps.mov.avs")
v39 = LWLibavVideoSource(source_dir + "v39f.avi").ConvertToYV24()
#v39 = v39.crop(0, 12, 0, -4)
v39 = v39.adjustSize()
v39 = v39.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v39 = v39.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v39.prefetch(6)
#adjustframerate
