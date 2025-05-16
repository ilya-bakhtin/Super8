import("..\1977-1979.avs")
v110 = LSMASHVideoSource(dst_dir + "v110f.mp4").ConvertToYV24()
b_ex = undefined
v110o = v110
v110 = v110.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v110i = v110
v110 = expr(v110.extractY, v110.extractU, v110.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v110 = v110.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.009, gamma=1.)
v110a = v110i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v110 = v110i
#return v110i.interleave(v110).hist_levels.prefetch
v110 = v110.adjustSize
v110 = v110.assumeFPS(18)
v110 = v110.add_blank_audio
return v110.prefetch
#adjustframerate
