import("..\1989-sevas.avs")
v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
b_ex = undefined
v34_i = v34
v34 = v34.AdjustColor(ou = +22, ov = -16, x=10, y=10, w=-200, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v34 = v34.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.7, border_r=200)
v34_0 = v34
v34 = v34_i
v34 = v34.AdjustColor(ou = +22, ov = -16, x=v34.width*2/3, y=400, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v34.frameCount, width = v34.width, height = v34.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v34 = v34_0.mt_merge(v34, mask, luma = true)#.interleave(v34_0)
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate
