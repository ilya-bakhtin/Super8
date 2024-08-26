import("..\1989-Sevas.avs")
v95 = LSMASHVideoSource(dst_dir + "v95f.mp4").ConvertToYV24()
v95_i = v95
#v95 = v95.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v95 = v95.trim(113, -1).loop(v95.frameCount).crop(0, v95.height - add_height - 200, 0, -200).stackVertical(v95)
#return v95.histogram.prefetch
v95 = v95.AdjustColor(ou = +10, ov = -7, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v95 = v95.colorYUV(off_u = -4, off_v = +4)
v95 = v95.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.5)
#v95 = v95.animate(200, 220, "gamma_a", 0.3, 0.6)
#v95 = v95.crop(0, add_height, 0, 0)
#return v95.hist_levels.prefetch
#v95 = v95.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
v95 = v95.adjustSize
v95 = v95.assumeFPS(18)
v95 = v95.add_blank_audio
return v95.prefetch
#adjustframerate
