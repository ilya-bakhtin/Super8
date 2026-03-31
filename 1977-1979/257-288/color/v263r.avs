import("..\1977-1979.avs")
v263 = LSMASHVideoSource(dst_dir + "v263f.mp4").ConvertToYV24()
b_ex = undefined
v263o = v263
v263 = v263.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v263i = v263
v263 = expr(v263.extractY, v263.extractU, v263.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v263 = v263.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v263a = v263i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v263i.interleave(v263).hist_levels.prefetch
v263 = v263.adjustSize
v263 = v263.assumeFPS(18)
v263 = v263.add_blank_audio
return v263.prefetch
#adjustframerate
