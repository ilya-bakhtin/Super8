import("..\8mm film 2048x1536 18Fps.mov.avs")
v121 = LWLibavVideoSource(source_dir + "v121f.avi", cache=false).ConvertToYV24()
v121 = v121.ColorYUV(off_y = 8)
v121 = v121.AdjustColor(ou=-2, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0., hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v121 = v121.colorYUV(off_u=0, off_v=0, gamma_y=16)
#v121 = v121.applyGradationCurves(lumaPoints="0,0, 16,16, 17,18, 19,21, 20,23, 21,25, 22,25, 23,25, 24,25, 25,25, 30,30, 40,40, 100,100, 235,235, 255,255")
return v121.prefetch(6)
#adjustframerate
