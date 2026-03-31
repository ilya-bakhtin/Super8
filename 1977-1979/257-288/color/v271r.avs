import("..\1977-1979.avs")
v271 = LSMASHVideoSource(dst_dir + "v271f.mp4").ConvertToYV24()
b_ex = undefined
v271o = v271
v271 = v271.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v271i = v271
v271 = expr(v271.extractY, v271.extractU, v271.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v271 = v271.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v271a = v271i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v271i.interleave(v271).hist_levels.prefetch
v271 = v271.adjustSize
v271 = v271.assumeFPS(18)
v271 = v271.add_blank_audio
return v271.prefetch
#adjustframerate
