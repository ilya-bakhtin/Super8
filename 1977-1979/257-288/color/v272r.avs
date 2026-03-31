import("..\1977-1979.avs")
v272 = LSMASHVideoSource(dst_dir + "v272f.mp4").ConvertToYV24()
b_ex = undefined
v272o = v272
v272 = v272.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v272i = v272
v272 = expr(v272.extractY, v272.extractU, v272.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v272 = v272.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v272a = v272i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v272i.interleave(v272).hist_levels.prefetch
v272 = v272.adjustSize
v272 = v272.assumeFPS(18)
v272 = v272.add_blank_audio
return v272.prefetch
#adjustframerate
