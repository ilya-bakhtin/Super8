import("..\1977-1979.avs")
v262 = LSMASHVideoSource(dst_dir + "v262f.mp4").ConvertToYV24()
b_ex = undefined
v262o = v262
v262 = v262.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v262i = v262
v262 = expr(v262.extractY, v262.extractU, v262.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v262 = v262.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v262a = v262i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v262i.interleave(v262).hist_levels.prefetch
v262 = v262.adjustSize
v262 = v262.assumeFPS(18)
v262 = v262.add_blank_audio
return v262.prefetch
#adjustframerate
