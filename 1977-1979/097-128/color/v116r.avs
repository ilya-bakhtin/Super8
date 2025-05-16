import("..\1977-1979.avs")
v116 = LSMASHVideoSource(dst_dir + "v116f.mp4").ConvertToYV24()
b_ex = undefined
v116o = v116
v116 = v116.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v116i = v116
v116 = expr(v116.extractY, v116.extractU, v116.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v116 = v116.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v116a = v116i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v116i.interleave(v116).hist_levels.prefetch
v116 = v116.adjustSize
v116 = v116.assumeFPS(18)
v116 = v116.add_blank_audio
return v116.prefetch
#adjustframerate
