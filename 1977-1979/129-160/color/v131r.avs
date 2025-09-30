import("..\1977-1979.avs")
v131 = LSMASHVideoSource(dst_dir + "v131f.mp4").ConvertToYV24()
b_ex = undefined
v131o = v131
v131 = v131.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 131. - 131. / * 131. * 131. +"
ex_v = "z" #ex_uv + "z 131. - 131. / * 131. * 131. +"
v131i = v131
v131 = expr(v131.extractY, v131.extractU, v131.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v131 = v131.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v131a = v131i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v131i.interleave(v131).hist_levels.prefetch
v131 = v131.adjustSize
v131 = v131.assumeFPS(18)
v131 = v131.add_blank_audio
return v131.prefetch
#adjustframerate
