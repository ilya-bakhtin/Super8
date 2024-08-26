import("..\1989-Sevas.avs")
v114 = LSMASHVideoSource(dst_dir + "v114f.mp4").ConvertToYV24()
v114_i = v114
#v114 = v114.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 300
#v114 = v114.trim(1, -1).loop(v114.frameCount).crop(0, 0, 0, add_height - v114.height).stackVertical(v114)
#return v114.histogram.prefetch
v114 = v114.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v114 = v114.colorYUV(off_u = -2, off_v = +2)
v114 = v114.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=0.8)
#v114 = v114.animate(200, 220, "gamma_a", 0.3, 0.6)
#v114 = v114.crop(0, add_height, 0, 0)
#return v114.hist_levels.prefetch
#v114 = v114.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
v114 = v114.adjustSize
v114 = v114.assumeFPS(18)
v114 = v114.add_blank_audio
return v114.prefetch
#adjustframerate
