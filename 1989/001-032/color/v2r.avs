import("..\1989-sevas.avs")
v2 = LSMASHVideoSource(dst_dir + "v2f.mp4").ConvertToYV24()
#v2 = v2.autolevels(input_low = 90, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
v2_i = v2
b_ex = undefined
b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v2 = v2.AdjustColor(ou = +18, ov = -12, x=10, y=10, w=-v2.width*1/3, h=-v2.height*1/3, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")#,\
#                    redPoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v2 = v2.colorYUV(off_u = -2, off_v = -2)
v2 = v2.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=10, border_t=10, border_r=v2.width*1/3, border_b=v2.height*1/3, gamma=0.5)
#return v2.hist_levels.prefetch
###
v2_0 = v2
v2 = v2_i
#v2 = v2.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v2 = v2.AdjustColor(ou = +0, ov = -0, x=v2.width*3/4, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=2, sat=2.5, gam_mac=true, b_expr=b_ex,\
                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v2 = v2.colorYUV(off_u = -4, off_v = +4)
v2 = v2.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=v2.width*3/4, border_t=10, gamma=0.7)
mask = BlankClip(length = v2.frameCount, width = v2.width, height = v2.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 0.9 - 1.2 * 256 *", chroma="-128")
#return mask
v2 = v2_0.mt_merge(v2, mask, luma = true)
v2 = v2.colorYUV(off_u = -4, off_v = -0)
#return v2_0.interleave(v2).prefetch
###
v2 = v2.adjustSize
#return LSMASHVideoSource(dst_dir + "v2rc-.mp4").ConvertToYV24().interleave(v2).hist_levels.prefetch
v2 = v2.assumeFPS(18)
v2 = v2.add_blank_audio
return v2.prefetch
#adjustframerate
