import("..\1989-sevas.avs")
v47 = LSMASHVideoSource(dst_dir + "v47f.mp4").ConvertToYV24()
v47_i = v47
b_ex = undefined
v47 = v47.AdjustColor(ou = +16, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.0, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
v47 = v47.autolevels(filterRadius=0, minRng=0, ignore_low=0.0, ignore_high=0.003, gamma=0.6)
###
v47_0 = v47
v47 = v47_i
#add_height = 100
#v47 = v47.stackVertical(v47.trim(115, -1).loop(v47.frameCount).crop(0, 0, 0, add_height - v47.height))
v47 = v47.AdjustColor(ou = +18, ov = -12, x=v47.width*1/2, y=v47.height*1/2, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
#v47 = v47.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v47.frameCount, width = v47.width, height = v47.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v47 = v47_0.mt_merge(v47, mask, luma = true)
#return v47_0.interleave(v47).prefetch
###
v47 = v47.adjustSize
v47 = v47.assumeFPS(18)
v47 = v47.add_blank_audio
return v47.prefetch
#adjustframerate
