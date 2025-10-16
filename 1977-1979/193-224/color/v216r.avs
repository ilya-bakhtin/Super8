import("..\1977-1979.avs")
v216 = LSMASHVideoSource(dst_dir + "v216f.mp4").ConvertToYV24()
b_ex = undefined
v216o = v216
v216 = v216.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v216i = v216
v216 = expr(v216.extractY, v216.extractU, v216.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v216 = v216.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v216a = v216i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v216i.interleave(v216).hist_levels.prefetch
v216 = v216.adjustSize
v216 = v216.assumeFPS(18)
v216 = v216.add_blank_audio
return v216.prefetch
#adjustframerate
