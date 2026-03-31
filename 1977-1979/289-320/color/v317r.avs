import("..\1977-1979.avs")
v317 = LSMASHVideoSource(dst_dir + "v317f.mp4").ConvertToYV24()
b_ex = undefined
v317o = v317
v317 = v317.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v317i = v317
v317 = expr(v317.extractY, v317.extractU, v317.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v317 = v317.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v317a = v317i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v317i.interleave(v317).hist_levels.prefetch
v317 = v317.adjustSize
v317 = v317.assumeFPS(18)
v317 = v317.add_blank_audio
return v317.prefetch
#adjustframerate
