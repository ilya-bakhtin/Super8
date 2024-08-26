import("..\1989-sevas.avs")
v64 = LSMASHVideoSource(dst_dir + "v64f.mp4").ConvertToYV24()
#v64 = v64.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v64 = v64.trim(405, -1).loop(v64.frameCount).crop(0, 0, 0, add_height - v64.height).stackVertical(v64)
#return v64.histogram.prefetch
v64 = v64.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v64 = v64.colorYUV(off_u = -2, off_v = +2)
v64 = v64.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
#v64 = v64.crop(0, add_height, 0, 0)
#v64 = v64.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v64.histogram.prefetch
#return v64.hist_levels.prefetch
v64 = v64.adjustSize
v64 = v64.assumeFPS(18)
v64 = v64.add_blank_audio
return v64.prefetch
#adjustframerate
