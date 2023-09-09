import("..\1983-Moskva-Tallinn.avs")
v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.autolevels
#v64 = v64.colorYUV(off_y = -12)
#v64 = v64.animate(80, 100, "offset_y", -12, 0)
b_ex = "x 60 < y 60 < & z x > & z y > & z x - 20 > & z y - 20 > & x y + 2 / z ?"
v64 = v64.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=1.3, gam_mac=true, b_expr=b_ex)#,\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v64 = v64.colorYUV(off_u = +4, off_v = -4)
v64 = v64.autolevels(filterRadius = 0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.7)
#return v64.hist_levels
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate
