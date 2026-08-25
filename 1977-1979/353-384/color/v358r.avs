import("..\1977-1979.avs")
v358 = LSMASHVideoSource(dst_dir + "v358f.mp4").ConvertToYV24()
b_ex = undefined
#return v358.histogram.prefetch
v358o = v358
v358 = v358.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v358i = v358
v358 = expr(v358.extractY, v358.extractU, v358.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v358 = v358.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v358a = v358i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v358i.interleave(v358).hist_levels.prefetch
v358 = v358.adjustSize
v358 = v358.assumeFPS(18)
v358 = v358.add_blank_audio
return v358.prefetch
#adjustframerate
