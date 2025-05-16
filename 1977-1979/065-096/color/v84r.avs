import("..\1977-1979.avs")
v84 = LSMASHVideoSource(dst_dir + "v84f.mp4").ConvertToYV24()
b_ex = undefined
v84o = v84
v84 = v84.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v84i = v84
v84 = expr(v84.extractY, v84.extractU, v84.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v84 = v84.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v84a = v84i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v84i.interleave(v84).hist_levels.prefetch
v84 = v84.adjustSize
v84 = v84.assumeFPS(18)
v84 = v84.add_blank_audio
return v84.prefetch
#adjustframerate
