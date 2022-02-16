import("..\8mm film 2048x1536 18Fps.mov.avs")
v95 = LWLibavVideoSource(source_dir + "v095f.avi", cache=false).ConvertToYV24()
#v95 = v95.crop(0, 8, 0, -4)
v95 = v95.adjustSize()
v95 = v95.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v95 = v95.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v95.prefetch(6)
#adjustframerate
