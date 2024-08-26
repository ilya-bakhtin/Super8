import("..\1987-alexej-armada.avs")
v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
#v23 = v23.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 400
#v23 = v23.trim(1, -1).loop(v23.frameCount).crop(0, 0, 0, add_height - v23.height).stackVertical(v23)
#return v23.histogram.prefetch
v23 = v23.AdjustColor(ou = +14, ov = -14, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v23 = v23.colorYUV(off_u = -4, off_v = +4)
#v23 = v23.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003)
#v23 = v23.crop(0, add_height, 0, 0)
#v23 = v23.autolevels(filterRadius=0, minRng=0, output_low = 16, output_high = 250, input_low = 0, input_high = 255, autolevel = false)
#return v23.hist_levels.prefetch
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate
