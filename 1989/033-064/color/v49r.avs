import("..\1989-sevas.avs")
v49 = LSMASHVideoSource(dst_dir + "v49f.mp4").ConvertToYV24()
v49_i = v49
b_ex = undefined
v49 = v49.AdjustColor(ou = +16, ov = -8, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
###
v49_0 = v49
v49 = v49_i
add_height = 50
v49 = v49.stackVertical(v49.trim(3, -1).loop(v49.frameCount).crop(0, 0, 0, add_height - v49.height))
v49 = v49.AdjustColor(ou = +16, ov = -8, x=v49.width*3/4, y=v49.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v49 = v49.crop(0, 0, 0, -add_height)
v49 = v49.colorYUV(off_u=4, off_v=-4)
mask = BlankClip(length = v49.frameCount, width = v49.width, height = v49.height, pixel_type="YV12")
#mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
#return mask
v49 = v49_0.mt_merge(v49, mask, luma = true)
#return v49_0.interleave(v49).prefetch
###
v49 = v49.adjustSize
v49 = v49.assumeFPS(18)
v49 = v49.add_blank_audio
return v49.prefetch
#adjustframerate
