import("..\1989-sevas.avs")
v36 = LSMASHVideoSource(dst_dir + "v36f.mp4").ConvertToYV24()
v36_i = v36
b_ex = undefined
v36 = v36.AdjustColor(ou = +18, ov = -14, x=200, y=10, w=-400, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v36 = v36.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6, border_l=200, border_r=400)
###
v36_0 = v36
v36 = v36_i
add_height = 50
v36 = v36.stackVertical(v36.trim(1052, -1).loop(v36.frameCount).crop(0, 0, 0, add_height - v36.height))
v36 = v36.AdjustColor(ou = +20, ov = -14, x=v36.width*3/4, y=v36.height*3/4, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
#v36 = v36.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=v36.width*3/4, border_t=v36.height*3/4, border_r=10, border_b=10)
v36 = v36.crop(0, 0, 0, -add_height)
v36 = v36.colorYUV(off_u = -8, off_v = +8)
mask = BlankClip(length = v36.frameCount, width = v36.width, height = v36.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.4 - 1.2 * 256 *", chroma="-128")
#return mask
v36 = v36_0.mt_merge(v36, mask, luma = true)
#v36 = v36.colorYUV(off_u = -4, off_v = -0)
#return v36_0.interleave(v36).prefetch
###
v36 = v36.adjustSize
v36 = v36.assumeFPS(18)
v36 = v36.add_blank_audio
return v36.prefetch
#adjustframerate
