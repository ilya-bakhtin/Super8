import("..\8mm film 2048x1536 18Fps.mov.avs")
v100 = LWLibavVideoSource(source_dir + "v100f.avi", cache=false).ConvertToYV24()
v100 = v100.colorYUV(off_y=-4, gain_y=-16)
v100 = v100.AdjustColor(ou=-4, ov=2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=3, red=1, grn=1, blu=1, gam_mac=true)
v100 = v100.colorYUV(off_u=-4, off_v=-4, gamma_y=0)
return v100.prefetch(6)
#adjustframerate
