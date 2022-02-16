import("..\8mm film 2048x1536 18Fps.mov.avs")
v89 = LWLibavVideoSource(source_dir + "v089f.avi", cache=false).ConvertToYV24()
#v89 = v89.crop(0, 8, 0, -4)
v89 = v89.adjustSize()
v89 = v89.AdjustColor(ou=2, ov=-6, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=3, red=1, grn=1, blu=1, gam_mac=true)
#v89 = v89.colorYUV(off_u=6, off_v=-6, gamma_y=0)
return v89.prefetch(6)
#adjustframerate
