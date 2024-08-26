import("..\1989-Sevas.avs")
function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v69 = LSMASHVideoSource(dst_dir + "v69f.mp4").ConvertToYV24()
b_ex = undefined
v69 = v69.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2., gam_mac=true, b_expr=b_ex)
v69 = v69.colorYUV(off_u = -2, off_v = -2)
v69 = v69.animate(98, 102, "gamma_a", 0.9, 0.7)
v69 = v69.adjustSize
v69 = v69.assumeFPS(18)
v69 = v69.add_blank_audio
return v69.prefetch
#adjustframerate
