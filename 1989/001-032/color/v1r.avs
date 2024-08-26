import("..\1989-sevas.avs")
v1 = LSMASHVideoSource(dst_dir + "v1f.mp4").ConvertToYV24()
v1_i = v1
b_ex = undefined
#v1 = v1.AdjustColor(ou = +12, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v1 = v1.AdjustColor(ou = +12, ov = -10, x=100, y=10, w=-400, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v1 = v1.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7)
###
v1_0 = v1
v1 = v1_i
#v1 = v1.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v1 = v1.AdjustColor(ou = +18, ov = -12, x=v1.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v1 = v1.colorYUV(off_u = +2, off_v = -2)
v1 = v1.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=v1.width*2/3, border_t=0, gamma=0.8)
mask = BlankClip(length = v1.frameCount, width = v1.width, height = v1.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v1 = v1_0.mt_merge(v1, mask, luma = true)#.interleave(v1_0)
###
v1 = v1.adjustSize
v1 = v1.assumeFPS(18)
v1 = v1.add_blank_audio
return v1.prefetch
#adjustframerate
