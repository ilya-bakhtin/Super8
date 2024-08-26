import("..\1989-sevas.avs")
v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
b_ex = undefined
v59 = v59.AdjustColor(ou = +18, ov = -12, x=200, y=10, w=-10, h=-400, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v59 = v59.colorYUV(off_u = +2, off_v = -2)
v59 = v59.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, border_l=200, border_t=400, gamma=0.9)
v59_0 = v59
v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
#v59 = v59.autolevels(input_low = 100, output_low = 0, input_high = 255, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v59 = v59.AdjustColor(ou = +18, ov = -12, x=v59.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.3, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
#v59 = v59.colorYUV(off_u = +2, off_v = -2)
v59 = v59.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, border_l=v59.width*2/3, border_t=0, gamma=0.8)
mask = BlankClip(length = v59.frameCount, width = v59.width, height = v59.height, pixel_type="YV12")
mask1 = mask.mt_lutspa(mode="relative", expr="y 2. 3. / < 0 y 2. 3. / - 3 * 255 * ?", chroma="-128") 
mask2 = mask.mt_lutspa(mode="relative", expr="y 1. 4. / > 255 y 4 * 255 * ?", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 3. 6. / < 0 x 5. 6. / > 255 x 3. 6. / - 3 * 255 * ? ?", chroma="-128")
mask = mask.mt_logic(mask1, "max")
mask = mask.mt_logic(mask2, "min")
#return mask
v59 = v59_0.mt_merge(v59, mask, luma = true)#.interleave(v59_0)
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate
