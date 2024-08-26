import("..\1989-sevas.avs")
v61 = LSMASHVideoSource(dst_dir + "v61f.mp4").ConvertToYV24()
v61_i =v61
b_ex = undefined
add_height = 200
v61 = v61.trim(405, -1).loop(v61.frameCount).crop(0, 0, 0, add_height - v61.height).stackVertical(v61)
v61 = v61.AdjustColor(ou = +14, ov = -10, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=0, sat=2.7, gam_mac=true, b_expr=b_ex,\
                      bluePoints="0,0, 26,0, 40,7, 48,33, 66,57, 86,86, 107,107, 130,130, 150,150, 170,170, 180,180, 200,200, 220,220, 255,255")
v61 = v61.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.5)
v61 = v61.crop(0, add_height, 0, 0)
v61 = v61.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 60, input_high = 255, autolevel = false)#return v61.histogram.prefetch
###
v61_0 = v61
v61 = v61_i
add_height = 100
v61 = v61.stackVertical(v61.trim(405, -1).loop(v61.frameCount).crop(0, 0, 0, add_height - v61.height))
v61 = v61.AdjustColor(ou = +14, ov = -10, x=v61.width*1/2, y=v61.height*2/333, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v61 = v61.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = 60, input_high = 255, autolevel = false)#return v61.histogram.prefetch
v61 = v61.crop(0, 0, 0, -add_height)
mask = BlankClip(length = v61.frameCount, width = v61.width, height = v61.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v61 = v61_0.mt_merge(v61, mask, luma = true)
#return v61_0.interleave(v61).prefetch
###
v61 = v61.adjustSize
v61 = v61.assumeFPS(18)
v61 = v61.add_blank_audio
return v61.prefetch
#adjustframerate
