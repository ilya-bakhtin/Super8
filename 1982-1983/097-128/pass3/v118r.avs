import("..\8mm film 2048x1536 18Fps.mov.avs")
v118 = LWLibavVideoSource(source_dir + "v118f.avi", cache=false).ConvertToYV24()
v118 = v118.autolevels.tweak(sat=1.5, coring=false)
#v118 = v118.AdjustColor(ou=4, ov=-2, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=0, sat=1.5, red=1, grn=1, blu=1, gam_mac=false)
v118 = v118.colorYUV(off_u=6, off_v=-2, gamma_y=0)
return v118.prefetch(6)
#adjustframerate
