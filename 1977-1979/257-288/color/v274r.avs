import("..\1977-1979.avs")
v274 = LSMASHVideoSource(dst_dir + "v274f.mp4").ConvertToYV24()
b_ex = undefined
v274o = v274
v274 = v274.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v274i = v274
v274 = expr(v274.extractY, v274.extractU, v274.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v274 = v274.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v274a = v274i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v274i.interleave(v274).hist_levels.prefetch
v274 = v274.adjustSize
v274 = v274.assumeFPS(18)
v274 = v274.add_blank_audio
return v274.prefetch
#adjustframerate
