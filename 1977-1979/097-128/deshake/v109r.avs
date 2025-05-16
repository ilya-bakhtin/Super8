import("..\1977-1979.avs")
v109 = LSMASHVideoSource(dst_dir + "v109f.mp4").ConvertToYV24()
b_ex = undefined
v109o = v109
v109 = v109.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v109i = v109
v109 = expr(v109.extractY, v109.extractU, v109.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v109 = v109.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.009, gamma=1.)
v109a = v109i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v109i.interleave(v109).hist_levels.prefetch
v109 = v109.adjustSize
v109 = v109.assumeFPS(18)
v109 = v109.add_blank_audio
return v109.prefetch
#adjustframerate
