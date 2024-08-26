import("..\1989-sevas.avs")
v3 = LSMASHVideoSource(dst_dir + "v3f.mp4").ConvertToYV24()
v3_i = v3
b_ex = undefined
v3 = v3.AdjustColor(ou = +20, ov = -14, x=800, y=100, w=-200, h=-600, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=800, border_t=100, border_r=200, border_b=600)
###
v3_0 = v3
v3 = v3_i
v3 = v3.AdjustColor(ou = +20, ov = -14, x=v3.width*3/4, y=v3.height*3/4, w=-10, h=-10, lo_th=0.4, hi_th=0.004, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex)
#v3 = v3.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.00003, gamma=0.5, border_l=v3.width*3/4, border_t=v3.height*3/4, border_r=10, border_b=10)
mask = BlankClip(length = v3.frameCount, width = v3.width, height = v3.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.5 - 1.2 * 256 *", chroma="-128")
#return mask
v3 = v3_0.mt_merge(v3, mask, luma = true)
#v3 = v3.colorYUV(off_u = -4, off_v = -0)
#return v3_0.interleave(v3).prefetch
###
v3 = v3.adjustSize
v3 = v3.assumeFPS(18)
v3 = v3.add_blank_audio
return v3.prefetch
#adjustframerate
