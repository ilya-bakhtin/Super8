import("..\8mm film 2048x1536 18Fps.mov.avs")
v50 = LWLibavVideoSource(source_dir + "v50f.avi").ConvertToYV24()
v50 = v50.crop(0, 0, 0, -8)
v50 = v50.adjustSize()
v50 = v50.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v50 = v50.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v50.prefetch(6)
#adjustframerate
