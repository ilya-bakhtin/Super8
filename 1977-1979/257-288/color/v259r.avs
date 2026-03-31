import("..\1977-1979.avs")
v259 = LSMASHVideoSource(dst_dir + "v259f.mp4").ConvertToYV24()
b_ex = undefined
v259o = v259
v259 = v259.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v259i = v259
v259 = expr(v259.extractY, v259.extractU, v259.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v259 = v259.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v259a = v259i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v259i.interleave(v259).hist_levels.prefetch
v259 = v259.adjustSize
v259 = v259.assumeFPS(18)
v259 = v259.add_blank_audio
return v259.prefetch
#adjustframerate
