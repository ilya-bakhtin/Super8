import("..\1989-Sevas.avs")
v79 = LSMASHVideoSource(dst_dir + "v79f.mp4").ConvertToYV24()
#v79 = v79.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
add_height = 200
v79 = v79.trim(399, -1).loop(v79.frameCount).crop(0, 0, 0, add_height - v79.height).stackVertical(v79)
#return v79.histogram.prefetch
v79 = v79.AdjustColor(ou = +12, ov = -5, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v79 = v79.colorYUV(off_u = -4, off_v = +4)
v79 = v79.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v79 = v79.crop(0, add_height, 0, 0)
v79 = v79.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
#return v79.hist_levels.prefetch
v79 = v79.adjustSize
v79 = v79.assumeFPS(18)
v79 = v79.add_blank_audio
return v79.prefetch
#adjustframerate
