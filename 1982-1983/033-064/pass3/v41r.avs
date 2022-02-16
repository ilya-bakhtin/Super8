import("..\8mm film 2048x1536 18Fps.mov.avs")
v41 = LWLibavVideoSource(source_dir + "v41f.avi").ConvertToYV24()
#v41 = v41.crop(0, 12, 0, -4)
v41 = v41.adjustSize()
v41 = v41.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v41 = v41.colorYUV(off_u=0, off_v=0, gamma_y=16)
return v41.prefetch(6)
#adjustframerate
