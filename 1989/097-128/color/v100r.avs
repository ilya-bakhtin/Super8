import("..\1989-Sevas.avs")
v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
v100_i = v100
#v100 = v100.autolevels(input_low = 20, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
add_height = 300
v100 = v100.trim(1, -1).loop(v100.frameCount).crop(0, 0, 0, add_height - v100.height).stackVertical(v100)
#return v100.histogram.prefetch
v100 = v100.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v100 = v100.colorYUV(off_u = +2, off_v = -2)
v100 = v100.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3)
#v100 = v100.animate(200, 220, "gamma_a", 0.3, 0.6)
v100 = v100.crop(0, add_height, 0, 0)
#return v100.hist_levels.prefetch
#v100 = v100.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
###
v100_0 = v100
v100 = v100_i
add_height = 100
v100 = v100.stackVertical(v100.trim(332, -1).loop(v100.frameCount).crop(0, v100.height - add_height, 0, 0))
v100 = v100.AdjustColor(ou = +12, ov = -6, x=v100.width*1/2, y=v100.height*1/2, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v100 = v100.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.3, border_l=v100.width*1/2, border_t=v100.height*1/2)
v100 = v100.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v100.frameCount, width = v100.width, height = v100.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v100 = v100_0.mt_merge(v100, mask, luma = true)
#return v100_0.interleave(v100).prefetch
###
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate
