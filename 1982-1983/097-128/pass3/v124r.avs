import("..\8mm film 2048x1536 18Fps.mov.avs")
v124 = LWLibavVideoSource(source_dir + "v124f.avi", cache=false).ConvertToYV24()
v124 = v124.autolevels(minRng=0)
v124 = v124.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v124 = v124.colorYUV(off_u=-6, off_v=-0, gamma_y=0)
#v124 = v124.colorYUV(autowhite=true)
v124 = v124.autolevels(gamma=1.3)
return v124.prefetch(6)
#adjustframerate
