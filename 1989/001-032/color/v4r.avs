import("..\1989-sevas.avs")
v4 = LSMASHVideoSource(dst_dir + "v4f.mp4").ConvertToYV24()
v4_i = v4
b_ex = undefined
v4 = v4.AdjustColor(ou = +20, ov = -14, x=300, y=10, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=300)
###
v4_0 = v4
v4 = v4_i
v4 = v4.AdjustColor(ou = +20, ov = -14, x=v4.width*3/4, y=v4.height*3/4, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
#v4 = v4.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=v4.width*3/4, border_t=v4.height*3/4, border_r=10, border_b=10)
mask = BlankClip(length = v4.frameCount, width = v4.width, height = v4.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.4 - 1.2 * 256 *", chroma="-128")
#return mask
v4 = v4_0.mt_merge(v4, mask, luma = true)
#v4 = v4.colorYUV(off_u = -4, off_v = -0)
#return v4_0.interleave(v4).prefetch
###
v4 = v4.adjustSize
v4 = v4.assumeFPS(18)
v4 = v4.add_blank_audio
return v4.prefetch
#adjustframerate
