import("..\1989-Sevas.avs")
v82 = LSMASHVideoSource(dst_dir + "v82f.mp4").ConvertToYV24()
v82_i = v82
#v82 = v82.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
#add_height = 200
#v82 = v82.trim(399, -1).loop(v82.frameCount).crop(0, 0, 0, add_height - v82.height).stackVertical(v82)
#return v82.histogram.prefetch
v82 = v82.AdjustColor(ou = +26, ov = -16, x=100, y=10, w=-10, h=-200, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)#,\
#                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255",\
#                      redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v82 = v82.colorYUV(off_u = -2, off_v = +2)
v82 = v82.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.5)
#v82 = v82.crop(0, add_height, 0, 0)
#v82 = v82.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)
#return v82.hist_levels.prefetch
###
v82_0 = v82
v82 = v82_i
add_height = 100
v82 = v82.stackVertical(v82.trim(29, -1).loop(v82.frameCount).crop(0, 0, 0, add_height - v82.height))
v82 = v82.AdjustColor(ou = +26, ov = -16, x=v82.width*3/4, y=v82.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v82 = v82.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v82.frameCount, width = v82.width, height = v82.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v82 = v82_0.mt_merge(v82, mask, luma = true)
#return v82_0.interleave(v82).prefetch
###
v82 = v82.adjustSize
v82 = v82.assumeFPS(18)
v82 = v82.add_blank_audio
return v82.prefetch
#adjustframerate
