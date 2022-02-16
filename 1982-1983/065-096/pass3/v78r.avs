import("..\8mm film 2048x1536 18Fps.mov.avs")
v78 = LWLibavVideoSource(source_dir + "v078f.avi", cache=false).ConvertToYV24()
#v78 = v78.crop(0, 8, 0, -4)
v78 = v78.adjustSize()
v78 = v78.AdjustColor(ou=0, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.00, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v78 = v78.colorYUV(off_u=-2, off_v=-2, gamma_y=0)
return v78.prefetch(6)
#adjustframerate
