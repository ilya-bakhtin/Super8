import("..\8mm film 2048x1536 18Fps.mov.avs")
v123 = LWLibavVideoSource(source_dir + "v123f.avi", cache=false).ConvertToYV24()
v123 = v123.autolevels(minRng=0)
v123 = v123.AdjustColor(ou=-4, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)#,\
#                        greenPoints="0,0, 16,16, 90,100, 235,235, 255,255")
v123 = v123.colorYUV(off_u=6, off_v=-6, gamma_y=0)
#v123 = v123.colorYUV(autowhite=true)
v123 = v123.autolevels(gamma=1.5)
return v123.prefetch(6)
#adjustframerate
