import("..\8mm film 2048x1536 18Fps.mov.avs")
v52 = LWLibavVideoSource(source_dir + "v52f.avi").ConvertToYV24()
#v52 = v52.crop(0, 8, 0, -4)
v52 = v52.adjustSize()
v52 = v52.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v52 = v52.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v52.prefetch(6)
#adjustframerate
