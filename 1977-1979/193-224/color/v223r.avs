import("..\1977-1979.avs")
v223 = LSMASHVideoSource(dst_dir + "v223f.mp4").ConvertToYV24()
b_ex = undefined
v223o = v223
v223 = v223.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v223i = v223
v223 = expr(v223.extractY, v223.extractU, v223.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v223 = v223.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v223a = v223i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v223i.interleave(v223).hist_levels.prefetch
v223 = v223.adjustSize
v223 = v223.assumeFPS(18)
v223 = v223.add_blank_audio
return v223.prefetch
#adjustframerate
