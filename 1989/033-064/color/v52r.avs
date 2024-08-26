import("..\1989-sevas.avs")
v52 = LSMASHVideoSource(dst_dir + "v52f.mp4").ConvertToYV24()
v52_i = v52
b_ex = undefined
add_height = 200
v52 = v52.stackVertical(v52.trim(100, -1).loop(v52.frameCount).crop(0, 0, 0, add_height - v52.height))
v52 = v52.AdjustColor(ou = +16, ov = -8, x=200, y=300, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v52 = v52.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l = 200, border_t=0)
v52 = v52.crop(0, 0, 0, -add_height)
v52 = v52.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 30, input_high = 255, autolevel = false)#return v52.histogram.prefetch
###
v52_0 = v52
v52 = v52_i
add_height = 100
v52 = v52.stackVertical(v52.trim(102, -1).loop(v52.frameCount).crop(0, 0, 0, add_height - v52.height))
v52 = v52.AdjustColor(ou = +16, ov = -8, x=v52.width*3/4, y=v52.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
v52 = v52.crop(0, 0, 0, -add_height)
v52 = v52.colorYUV(off_u = 4, off_v = -4)
mask = BlankClip(length = v52.frameCount, width = v52.width, height = v52.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v52 = v52_0.mt_merge(v52, mask, luma = true)
#return v52_0.interleave(v52).prefetch
###
v52 = v52.adjustSize
v52 = v52.assumeFPS(18)
v52 = v52.add_blank_audio
return v52.prefetch
#adjustframerate
