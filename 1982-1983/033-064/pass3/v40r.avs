import("..\8mm film 2048x1536 18Fps.mov.avs")
v40 = LWLibavVideoSource(source_dir + "v40f.avi").ConvertToYV24()
#v40 = v40.crop(0, 12, 0, -4)
v40 = v40.adjustSize()
v40 = v40.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v40 = v40.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v40.prefetch(6)
#adjustframerate
