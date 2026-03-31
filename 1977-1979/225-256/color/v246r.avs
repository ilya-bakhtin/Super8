import("..\1977-1979.avs")
v246 = LSMASHVideoSource(dst_dir + "v246f.mp4").ConvertToYV24()
b_ex = undefined
v246o = v246
v246 = v246.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v246i = v246
v246 = expr(v246.extractY, v246.extractU, v246.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v246 = v246.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v246a = v246i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v246i.interleave(v246).hist_levels.prefetch
v246 = v246.adjustSize
v246 = v246.assumeFPS(18)
v246 = v246.add_blank_audio
return v246.prefetch
#adjustframerate
