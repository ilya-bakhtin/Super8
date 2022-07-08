import("..\1982-skola-1-N8-film.mov.avs")
v64 = LWLibavVideoSource(source_dir + "v64f.avi", cache=false).ConvertToYV24()
#v64 = v64.colorYUV(off_y=6)
#v64 = v64.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v64 = v64.AdjustColor(ou=-2, ov=-2, x=400, y=10, w=-10, h=-10, lo_th=0.01, hi_th=0.01, lock_chan=0, sat=1.8, red=1, grn=1, blu=1, gam_mac=true)
v64 = v64.colorYUV(off_u=-6, off_v=-2)
v64 = v64.autolevels(minRng=0, ignore_low=0, ignore_high=0, gamma=1.3)
#return v64.histogram("levels").prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
return v64.prefetch
#adjustframerate
