import("..\1981-1982-Kemerovo.avs")
function levels_x(clip c, int il, int ol, int ih, int oh)
{
    return c.autolevels(input_low = il, output_low = ol, input_high = ih, output_high = oh, autolevel = false, filterRadius = 0, minRng = 0)
}
v44 = LSMASHVideoSource(dst_dir + "v44f.mp4").ConvertToYV24()
v44 = v44.animate(0, 12, "levels_x", 0, 0, 255, 140, 0, 0, 255, 255)
b_ex = undefined
#return v44.histogram.prefetch
v44o = v44
v44 = v44.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v44.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v44i = v44
v44 = expr(v44.extractY, v44.extractU, v44.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v44 = v44.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v44a = v44i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v44 = v44.colorYUV(off_u = -10, off_v = +2)
#return v44o.interleave(v44).hist_levels
v44 = v44.adjustSize
v44 = v44.assumeFPS(18)
v44 = v44.add_blank_audio
return v44.prefetch
#adjustframerate
