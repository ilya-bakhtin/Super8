import("..\1989-sevas.avs")
v51 = LSMASHVideoSource(dst_dir + "v51f.mp4").ConvertToYV24()
v51_i = v51
b_ex = undefined
add_height = 200
v51 = v51.stackVertical(v51.trim(217, -1).loop(v51.frameCount).crop(0, 0, 0, add_height - v51.height))
v51 = v51.AdjustColor(ou = +16, ov = -8, x=200, y=300, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v51 = v51.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l = 200, border_t=300)
v51 = v51.crop(0, 0, 0, -add_height)
v51 = v51.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 255, autolevel = false)#return v51.histogram.prefetch
###
v51_0 = v51
v51 = v51_i
add_height = 100
v51 = v51.stackVertical(v51.trim(83, -1).loop(v51.frameCount).crop(0, 0, 0, add_height - v51.height))
v51 = v51.AdjustColor(ou = +16, ov = -8, x=v51.width*3/4, y=v51.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v51 = v51.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v51.frameCount, width = v51.width, height = v51.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v51 = v51_0.mt_merge(v51, mask, luma = true)
#return v51_0.interleave(v51).prefetch
###
v51 = v51.adjustSize
v51 = v51.assumeFPS(18)
v51 = v51.add_blank_audio
return v51.prefetch
#adjustframerate
