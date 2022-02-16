import("..\8mm film 2048x1536 18Fps.mov.avs")
v36 = LWLibavVideoSource(source_dir + "v36f.avi").ConvertToYV24()
#v36 = v36.crop(0, 12, 0, -4)
v36 = v36.adjustSize()
v36 = v36.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v36 = v36.colorYUV(off_u=8, off_v=-8, gamma_y = 0)
return v36.prefetch(6)
#adjustframerate
