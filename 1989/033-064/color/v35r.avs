import("..\1989-sevas.avs")
v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
b_ex = undefined
v35_i = v35
v35 = v35.AdjustColor(ou = +32, ov = -24, x=100, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
v35 = v35.colorYUV(off_u = +2, off_v = -2)
v35 = v35.autolevels(filterRadius=0, minRng=0, ignore_low=0.009, ignore_high=0.003, gamma=0.7, border_l=100)
v35_0 = v35
v35 = v35_i
v35 = v35.AdjustColor(ou = +32, ov = -24, x=v35.width*2/3, y=600, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v35.frameCount, width = v35.width, height = v35.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.1 - 0.9 / 256 *", chroma="-128") 
#return mask
v35 = v35_0.mt_merge(v35, mask, luma = true)#.interleave(v35_0)
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate
