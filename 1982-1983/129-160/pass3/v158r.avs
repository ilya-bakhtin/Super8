import("..\8mm film 2048x1536 18Fps.mov.avs")
v158 = LWLibavVideoSource(source_dir + "v158f.avi", cache=false).ConvertToYV24()
v158 = v158.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v158 = v158.colorYUV(off_u=-2, off_v=2)
v158 = v158.adjustBorders
return v158.prefetch(6)
#adjustframerate
