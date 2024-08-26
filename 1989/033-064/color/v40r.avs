import("..\1989-sevas.avs")
v40 = LSMASHVideoSource(dst_dir + "v40f.mp4").ConvertToYV24()
b_ex = undefined
v40_i = v40
v40 = v40.AdjustColor(ou = +20, ov = -14, x=v40.width*1/2, y=10, w=-v40.width*1/4, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v40 = v40.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.7, border_l=v40.width*1/2, border_r=v40.width*1/4)
v40_0 = v40
v40 = v40_i
v40 = v40.AdjustColor(ou = +20, ov = -14, x=v40.width*3/4, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v40.frameCount, width = v40.width, height = v40.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v40 = v40_0.mt_merge(v40, mask, luma = true)#.interleave(v40_0)
v40 = v40.adjustSize
v40 = v40.assumeFPS(18)
v40 = v40.add_blank_audio
return v40.prefetch
#adjustframerate
