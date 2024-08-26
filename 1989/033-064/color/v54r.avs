import("..\1989-sevas.avs")
v54 = LSMASHVideoSource(dst_dir + "v54f.mp4").ConvertToYV24()
v54_i = v54
b_ex = undefined
v54 = v54.AdjustColor(ou = +16, ov = -10, x=100, y=10, w=-10, h=-10, lo_th=0.0, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
v54 = v54.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, border_l=100)
###
v54_0 = v54
v54 = v54_i
#add_height = 100
#v54 = v54.stackVertical(v54.trim(115, -1).loop(v54.frameCount).crop(0, 0, 0, add_height - v54.height))
v54 = v54.AdjustColor(ou = +16, ov = -10, x=v54.width*3/4, y=v54.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
#v54 = v54.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v54.frameCount, width = v54.width, height = v54.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v54 = v54_0.mt_merge(v54, mask, luma = true)
#return v54_0.interleave(v54).prefetch
###
v54 = v54.adjustSize
v54 = v54.assumeFPS(18)
v54 = v54.add_blank_audio
return v54.prefetch
#adjustframerate
