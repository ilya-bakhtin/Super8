import("..\1989-Sevas.avs")
v19 = LSMASHVideoSource(dst_dir + "v19f.mp4").ConvertToYV24()
v19_i = v19
b_ex = undefined
v19 = v19.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat_0=1.9, gam_mac=true, b_expr=b_ex)
v19 = v19.colorYUV(off_u = -1, off_v = +1)
v19 = v19.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 70, input_high = 240, autolevel = false, gamma=0.8)
v19_0 = v19
v19 = v19_i
b_ex = undefined
v19 = v19.AdjustColor(ou = +14, ov = -8, x=v19.width*2/3, y=600, w=-10, h=-10, lo_th=0.004, hi_th=0.04, lock_chan=1, sat_0=1.9, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v19 = v19.colorYUV(off_u = -1, off_v = +1)
v19 = v19.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 50, input_high = 245, autolevel = false, gamma=0.8)
mask = BlankClip(length = v19.frameCount, width = v19.width, height = v19.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.2 - 0.8 / 256 *", chroma="-128") 
#return mask
v19 = v19_0.mt_merge(v19, mask, luma = true)#.interleave(v19_0)
v19 = v19.adjustSize
v19 = v19.assumeFPS(18)
v19 = v19.add_blank_audio
return v19.prefetch
#adjustframerate
