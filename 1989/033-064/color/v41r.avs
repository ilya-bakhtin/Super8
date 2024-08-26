import("..\1989-sevas.avs")
v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
b_ex = undefined
v41_i = v41
v41 = v41.AdjustColor(ou = +18, ov = -12, x=200, y=10, w=-v41.width*1/4, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v41 = v41.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.5, border_l=200, border_r=v41.width*1/4)
###
v41_0 = v41
v41 = v41_i
add_height = 100
v41 = v41.stackVertical(v41.trim(115, -1).loop(v41.frameCount).crop(0, 0, 0, add_height - v41.height))
v41 = v41.AdjustColor(ou = +18, ov = -12, x=v41.width*3/4, y=v41.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v41 = v41.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v41.frameCount, width = v41.width, height = v41.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v41 = v41_0.mt_merge(v41, mask, luma = true)
#return v41_0.interleave(v41).prefetch
###
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate
