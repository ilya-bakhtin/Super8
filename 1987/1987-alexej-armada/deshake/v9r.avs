import("..\1987-alexej-armada.avs")
v9 = LSMASHVideoSource(dst_dir + "v9f.mp4").ConvertToYV24()
#v9 = v9.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v9 = v9.trim(399, -1).loop(v9.frameCount).crop(0, 0, 0, add_height - v9.height).stackVertical(v9)
#return v9.histogram.prefetch
v9 = v9.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v9 = v9.colorYUV(off_u = -2, off_v = +2)
v9 = v9.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
#v9 = v9.crop(0, add_height, 0, 0)
#v9 = v9.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#return v9.hist_levels.prefetch
v9 = v9.adjustSize
v9 = v9.assumeFPS(18)
v9 = v9.add_blank_audio
return v9.prefetch
#adjustframerate
