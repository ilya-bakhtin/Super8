import("..\8mm film 2048x1536 18Fps.mov.avs")
v43 = LWLibavVideoSource(source_dir + "v43f.avi").ConvertToYV24()
#v43 = v43.crop(0, 12, 0, -4)
v43 = v43.adjustSize()
v43 = v43.AdjustColor(ou=6, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v43 = v43.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v43.prefetch(6)
#adjustframerate
