import("..\1989-Sevas.avs")
function gamma_a(clip c, float gamma)
{
    return c.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=gamma)
}
v66 = LSMASHVideoSource(dst_dir + "v66f.mp4").ConvertToYV24()
b_ex = undefined
v66 = v66.AdjustColor(ou = +12, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.04, lock_chan=1, sat=2.3, gam_mac=true, b_expr=b_ex)
v66 = v66.colorYUV(off_u = -2, off_v = +2)
v66 = v66.animate(70, 129, "gamma_a", 0.5, 0.8)
v66 = v66.adjustSize
v66 = v66.assumeFPS(18)
v66 = v66.add_blank_audio
return v66.prefetch
#adjustframerate
