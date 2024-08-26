import("..\1989-Sevas.avs")
function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v91 = LSMASHVideoSource(dst_dir + "v91f.mp4").ConvertToYV24()
v91_i = v91
b_ex = undefined
v91 = v91.AdjustColor(ou = +14, ov = -8, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v91 = v91.colorYUV(off_u = -4, off_v = +4)
v91 = v91.animate(200, 220, "gamma_a", 0.3, 0.6)
###
v91_0 = v91
v91 = v91_i
v91 = v91.AdjustColor(ou = +14, ov = -8, x=v91.width*3/4, y=v91.height*2/3, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.7, gam_mac=true, b_expr=b_ex)
v91 = v91.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=0.6, border_l=v91.width*3/4, border_t=v91.height*2/3)
mask = BlankClip(length = v91.frameCount, width = v91.width, height = v91.height, pixel_type="YV12")
mask = mask.mt_lutspa(mode="relative", expr="x 1.3 * y + 1.1 - 1.2 * 256 *", chroma="-128")
v91 = v91_0.mt_merge(v91, mask, luma = true)
###
v91 = v91.adjustSize
v91 = v91.assumeFPS(18)
v91 = v91.add_blank_audio
return v91.prefetch
#adjustframerate
