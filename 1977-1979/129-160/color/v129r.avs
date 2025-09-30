import("..\1977-1979.avs")
v129 = LSMASHVideoSource(dst_dir + "v129f.mp4").ConvertToYV24()
b_ex = undefined
v129o = v129
v129 = v129.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 129. - 129. / * 129. * 129. +"
ex_v = "z" #ex_uv + "z 129. - 129. / * 129. * 129. +"
v129i = v129
v129 = expr(v129.extractY, v129.extractU, v129.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v129 = v129.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v129a = v129i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v129i.interleave(v129).hist_levels.prefetch
v129 = v129.adjustSize
v129 = v129.assumeFPS(18)
v129 = v129.add_blank_audio
return v129.prefetch
#adjustframerate
