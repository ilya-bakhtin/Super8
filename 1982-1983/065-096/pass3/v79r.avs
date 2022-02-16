import("..\8mm film 2048x1536 18Fps.mov.avs")
v79 = LWLibavVideoSource(source_dir + "v079f.avi", cache=false).ConvertToYV24()
#v79 = v79.crop(0, 8, 0, -4)
v79 = v79.adjustSize()
v79 = v79.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.01, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v79 = v79.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v79.prefetch(6)
#adjustframerate
