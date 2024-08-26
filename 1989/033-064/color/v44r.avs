import("..\1989-sevas.avs")
v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
v44_i = v44
b_ex = undefined
v44 = v44.AdjustColor(ou = +22, ov = -14, x=10, y=10, w=-600, h=-10, lo_th=0.04, hi_th=0.004, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v44 = v44.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.5, border_r=600)
###
v44_0 = v44
v44 = v44_i
#add_height = 100
#v44 = v44.stackVertical(v44.trim(115, -1).loop(v44.frameCount).crop(0, 0, 0, add_height - v44.height))
v44 = v44.AdjustColor(ou = +18, ov = -12, x=v44.width*3/4, y=v44.height*3/4, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
#v44 = v44.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v44.frameCount, width = v44.width, height = v44.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.3 - 1.2 * 256 *", chroma="-128")
#return mask
v44 = v44_0.mt_merge(v44, mask, luma = true)
#return v44_0.interleave(v44).prefetch
###
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate
