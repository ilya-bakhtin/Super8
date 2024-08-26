import("..\1989-sevas.avs")
v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
v50_i = v50
b_ex = undefined
add_height = 100
v50 = v50.stackVertical(v50.trim(315, -1).loop(v50.frameCount).crop(0, 0, 0, add_height - v50.height))
v50 = v50.AdjustColor(ou = +16, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v50 = v50.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003)
v50 = v50.crop(0, 0, 0, -add_height)
v50 = v50.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)#return v50.histogram.prefetch
###
v50_0 = v50
v50 = v50_i
add_height = 100
v50 = v50.stackVertical(v50.trim(423, -1).loop(v50.frameCount).crop(0, 0, 0, add_height - v50.height))
v50 = v50.AdjustColor(ou = +16, ov = -8, x=v50.width*3/4, y=v50.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v50 = v50.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v50.frameCount, width = v50.width, height = v50.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v50 = v50_0.mt_merge(v50, mask, luma = true)
#return v50_0.interleave(v50).prefetch
###
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate
