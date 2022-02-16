import("..\8mm film 2048x1536 18Fps.mov.avs")
v115 = LWLibavVideoSource(source_dir + "v115f.avi", cache=false).ConvertToYV24()
v115 = v115.colorYUV(off_y=8)
v115 = v115.AdjustColor(ou=2, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.3, lock_chan=1, sat=1.5, red=1, grn=1, blu=1, gam_mac=true)
v115 = v115.colorYUV(off_u=12, off_v=-12, gamma_y=0)
return v115.prefetch(6)
#adjustframerate
