import("..\1989-Sevas.avs")
v93 = LSMASHVideoSource(dst_dir + "v93f.mp4").ConvertToYV24()
v93_i = v93
v93 = v93.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
add_height = 200
v93 = v93.trim(113, -1).loop(v93.frameCount).crop(0, v93.height - add_height - 200, 0, -200).stackVertical(v93)
v93 = v93.AdjustColor(ou = +13, ov = -10, x=10, y=10, w=-10, h=-300, lo_th=0.4, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v93 = v93.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.4)
v93 = v93.crop(0, add_height, 0, 0)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
v93 = v93.add_blank_audio
return v93.prefetch
#adjustframerate
