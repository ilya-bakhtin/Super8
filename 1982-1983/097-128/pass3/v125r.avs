import("..\8mm film 2048x1536 18Fps.mov.avs")
v125 = LWLibavVideoSource(source_dir + "v125f.avi", cache=false).ConvertToYV24()
v125 = v125.autolevels(minRng=0)
v125 = v125.autolevels(ignore_low=0, ignore_high=0)
v125 = v125.AdjustColor(ou=-6, ov=4, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0., lock_chan=0, sat=2, red=1, grn=1, blu=1, gam_mac=true)
#v125 = v125.colorYUV(off_u=-6, off_v=-0, gamma_y=0)
v125 = v125.autolevels(minRng=0, gamma=0.7)
return v125.prefetch(6)
#adjustframerate
