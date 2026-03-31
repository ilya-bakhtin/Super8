import("..\1977-1979.avs")
v339 = LSMASHVideoSource(dst_dir + "v339f.mp4").ConvertToYV24()
b_ex = undefined
v339o = v339
v339 = v339.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v339i = v339
v339 = expr(v339.extractY, v339.extractU, v339.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v339 = v339.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v339a = v339i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v339i.interleave(v339).hist_levels.prefetch
v339 = v339.adjustSize
v339 = v339.assumeFPS(18)
v339 = v339.add_blank_audio
return v339.prefetch
#adjustframerate
