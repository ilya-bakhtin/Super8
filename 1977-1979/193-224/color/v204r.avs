import("..\1977-1979.avs")
v204 = LSMASHVideoSource(dst_dir + "v204f.mp4").ConvertToYV24()
b_ex = undefined
v204o = v204
v204 = v204.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v204i = v204
v204 = expr(v204.extractY, v204.extractU, v204.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v204 = v204.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v204a = v204i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v204i.interleave(v204).hist_levels.prefetch
v204 = v204.adjustSize
v204 = v204.assumeFPS(18)
v204 = v204.add_blank_audio
return v204.prefetch
#adjustframerate
