import("..\1987-svatba.avs")
v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
#v34 = v34.autolevels(input_low = 8, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v34 = v34.trim(1, -1).loop(v34.frameCount).crop(0, 0, 0, add_height - v34.height).stackVertical(v34)
#return v34.histogram.prefetch
v34 = v34.AdjustColor(ou = +8, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat=1.8, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v34 = v34.autolevels(filterRadius=0, minRng=0, ignore_low=0.0003, ignore_high=0.003, gamma=1.5)
#v34 = v34.crop(0, add_height, 0, 0)
#v34 = v34.autolevels(filterRadius=0, minRng=0, output_low = 8, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
v34 = v34.colorYUV(off_u = +2, off_v = -2)
#return v34.hist_levels.prefetch
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate
