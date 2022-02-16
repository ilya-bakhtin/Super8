import("..\8mm film 2048x1536 18Fps.mov.avs")
v159 = LWLibavVideoSource(source_dir + "v159f.avi", cache=false).ConvertToYV24()
v159 = v159.AdjustColor(ou=6, ov=-3, x=200, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v159 = v159.colorYUV(off_u=-2, off_v=2)
v159 = v159.adjustBorders
return v159.prefetch(6)
#adjustframerate
