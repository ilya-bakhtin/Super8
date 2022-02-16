import("..\8mm film 2048x1536 18Fps.mov.avs")
v49 = LWLibavVideoSource(source_dir + "v49f.avi").ConvertToYV24()
#v49 = v49.crop(0, 12, 0, -4)
v49 = v49.adjustSize()
v49 = v49.AdjustColor(ou=4, ov=-4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v49 = v49.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v49.prefetch(6)
#adjustframerate
