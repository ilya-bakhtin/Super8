import("..\1989-sevas.avs")
v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
v58_i = v58
b_ex = undefined
add_height = 200
v58 = v58.stackVertical(v58.trim(303, -1).loop(v58.frameCount).crop(0, v58.height - add_height, 0, 0))
v58 = v58.AdjustColor(ou = +14, ov = -8, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v58 = v58.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=200, gamma=0.7)
v58 = v58.crop(0, 0, 0, -add_height)
v58 = v58.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v58.histogram.prefetch
###
v58_0 = v58
v58 = v58_i
add_height = 100
v58 = v58.stackVertical(v58.trim(307, -1).loop(v58.frameCount).crop(0, v58.height - add_height, 0, 0))
v58 = v58.AdjustColor(ou = +14, ov = -8, x=v58.width*3/4, y=v58.height*2/333, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v58 = v58.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v58.frameCount, width = v58.width, height = v58.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v58 = v58_0.mt_merge(v58, mask, luma = true)
#return v58_0.interleave(v58).prefetch
###
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate
