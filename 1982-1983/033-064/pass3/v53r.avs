import("..\8mm film 2048x1536 18Fps.mov.avs")
v53 = LWLibavVideoSource(source_dir + "v53f.avi").ConvertToYV24()
#v53 = v53.crop(0, 8, 0, -4)
v53 = v53.adjustSize()
v53 = v53.AdjustColor(ou=0, ov=-0, x=10, y=10, w=-10, h=-200, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v53 = v53.colorYUV(off_u=8, off_v=-8, gamma_y=0)
return v53.prefetch(6)
#adjustframerate
