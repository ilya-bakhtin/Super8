import("..\1977-1979.avs")
v334 = LSMASHVideoSource(dst_dir + "v334f.mp4").ConvertToYV24()
b_ex = undefined
v334o = v334
v334 = v334.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v334i = v334
v334 = expr(v334.extractY, v334.extractU, v334.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v334 = v334.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v334a = v334i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v334i.interleave(v334).hist_levels.prefetch
v334 = v334.adjustSize
v334 = v334.assumeFPS(18)
v334 = v334.add_blank_audio
return v334.prefetch
#adjustframerate
