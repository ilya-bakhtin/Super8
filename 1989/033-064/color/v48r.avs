import("..\1989-sevas.avs")
v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48_i = v48
b_ex = undefined
v48 = v48.AdjustColor(ou = +16, ov = -8, x=200, y=400, w=-400, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v48 = v48.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.8, border_l=200)
###
v48_0 = v48
v48 = v48_i
add_height = 100
v48 = v48.stackVertical(v48.trim(5, -1).loop(v48.frameCount).crop(0, 0, 0, add_height - v48.height))
v48 = v48.AdjustColor(ou = +18, ov = -12, x=v48.width*3/4, y=v48.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v48 = v48.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v48.frameCount, width = v48.width, height = v48.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v48 = v48_0.mt_merge(v48, mask, luma = true)
#return v48_0.interleave(v48).prefetch
###
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate
