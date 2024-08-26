import("..\1989-sevas.avs")
function levels(clip c, int input_low, int input_high, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, output_low = 0, output_high = 255, input_low = input_low, input_high = input_high, autolevel = false, gamma=gamma)
}
v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
v23_i = v23
b_ex = undefined
v23 = v23.AdjustColor(ou = +20, ov = -16, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
v23 = v23.colorYUV(off_u = -2, off_v = +2)
v23 = v23.animate(100, 160, "levels", 20, 255, 1., 85, 240, 0.8)
v23_0 = v23
v23 = v23_i
v23 = v23.AdjustColor(ou = +20, ov = -16, x=v23.width*2/3, y=600, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
mask = BlankClip(length = v23.frameCount, width = v23.width, height = v23.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x y + 1.2 - 0.8 / 256 *", chroma="-128") 
#return mask
v23 = v23_0.mt_merge(v23, mask, luma = true)#.interleave(v23_0)
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate
