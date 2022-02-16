import("..\8mm film 2048x1536 18Fps.mov.avs")
v122 = LWLibavVideoSource(source_dir + "v122f.avi", cache=false).ConvertToYV24()
v122 = v122.autolevels(minRng=0)
v122 = v122.AdjustColor(ou=-2, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v122 = v122.autolevels(gamma=1.2)
#v122 = v122.colorYUV(off_u=0, off_v=0, gamma_y=128)
return v122.prefetch(6)
#adjustframerate
