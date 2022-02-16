import("..\8mm film 2048x1536 18Fps.mov.avs")
v64 = LWLibavVideoSource(source_dir + "v64f.avi").ConvertToYV24()
#v64 = v64.crop(0, 8, 0, -4)
v64 = v64.adjustSize()
v64 = v64.AdjustColor(ou=-4, ov=0, x=10, y=10, w=-10, h=-10, lo_th=0.1, hi_th=0.1, lock_chan=1, sat=2, red=1, grn=1, blu=1, gam_mac=true)
v64 = v64.colorYUV(off_u=2, off_v=-2, gamma_y=0)
#return v64.histogram("levels").prefetch(6)
#v64 = v64.adjustBorders
return v64.prefetch(6)
#adjustframerate
