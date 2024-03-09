import("..\1989-Sevas.avs")
v32 = LSMASHVideoSource(dst_dir + "v32f.mp4").ConvertToYV24()
#v32 = v32.autolevels(input_low = 90, output_low = 0, input_high = 240, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#b_ex = "z x 1.5 * > z y 1.5 * > & z x y + 2. / - 2. / z ?"
v32_i = v32
v32 = v32.AdjustColor(ou = +36, ov = -28, x=200, y=10, w=-400, h=-400, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)#,\
#                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v32 = v32.colorYUV(off_u = +4, off_v = -4)
v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.5)
#v32 = v32.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 80, input_high = 250, autolevel = false, gamma=0.8)
#return v32.hist_levels.prefetch
v32_0 = v32
v32 = v32_i
v32 = v32.AdjustColor(ou = +36, ov = -28, x=v19.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)#,\
#                    bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v32 = v32.colorYUV(off_u = +4, off_v = -4)
#v32 = v32.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.5)
mask = BlankClip(length = v32.frameCount, width = v32.width, height = v32.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v32 = v32_0.mt_merge(v32, mask, luma = true)#.interleave(v32_0)
v32 = v32.adjustSize
v32 = v32.assumeFPS(18)
v32 = v32.add_blank_audio
return v32.prefetch
#adjustframerate
