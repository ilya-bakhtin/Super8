import("..\1977-1979.avs")
v243 = LSMASHVideoSource(dst_dir + "v243f.mp4").ConvertToYV24()
b_ex = undefined
v243o = v243
v243 = v243.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v243i = v243
v243 = expr(v243.extractY, v243.extractU, v243.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v243 = v243.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v243a = v243i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v243 = v243i
#return v243i.interleave(v243).hist_levels.prefetch
v243 = v243.adjustSize
v243 = v243.assumeFPS(18)
v243 = v243.add_blank_audio
return v243.prefetch
#adjustframerate
