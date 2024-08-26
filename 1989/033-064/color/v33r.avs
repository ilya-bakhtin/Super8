import("..\1989-sevas.avs")
v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
b_ex = undefined
v33_i = v33
v33 = v33.AdjustColor(ou = +26, ov = -18, x=200, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v33 = v33.autolevels(filterRadius=0, minRng=0, ignore_low=0.01, ignore_high=0.003, gamma=0.7)
v33_0 = v33
v33 = v33_i
v33 = v33.AdjustColor(ou = +26, ov = -18, x=v33.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v33.frameCount, width = v33.width, height = v33.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v33 = v33_0.mt_merge(v33, mask, luma = true)#.interleave(v33_0)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate
