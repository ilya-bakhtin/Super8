import("..\1983-1984.avs")
v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.colorYUV(off_y = 0)
#v64 = v64.autolevels(minRng=0, ignore_low=0, ignore_high=0)
v64 = v64.AdjustColor(ou = +12, ov = -10, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2, gam_mac=true,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v64 = v64.colorYUV(off_u = -4, off_v = +0)
#v64 = v64.autolevels(minRng=0, ignore_low=0.0003, ignore_high=0.0003, gamma=1.2)
#return v64.histogram("levels").prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate
