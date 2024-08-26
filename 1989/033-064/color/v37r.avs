import("..\1989-sevas.avs")
v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
v37_i = v37
b_ex = undefined
v37 = v37.AdjustColor(ou = +18, ov = -14, x=1000, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v37 = v37.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.6)
###
v37_0 = v37
v37 = v37_i
add_height = 50
v37 = v37.stackVertical(v37.trim(1, -1).loop(v37.frameCount).crop(0, 0, 0, add_height - v37.height))
v37 = v37.AdjustColor(ou = +18, ov = -14, x=v37.width*3/4, y=v37.height*3/4, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
#v37 = v37.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=v37.width*3/4, border_t=v37.height*3/4, border_r=10, border_b=10)
v37 = v37.crop(0, 0, 0, -add_height)
#v37 = v37.colorYUV(off_u = -8, off_v = +8)
mask = BlankClip(length = v37.frameCount, width = v37.width, height = v37.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.4 - 1.2 * 256 *", chroma="-128")
#return mask
v37 = v37_0.mt_merge(v37, mask, luma = true)
#v37 = v37.colorYUV(off_u = -4, off_v = -0)
#return v37_0.interleave(v37).prefetch
###
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate
