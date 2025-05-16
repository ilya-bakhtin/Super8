import("..\1977-1979.avs")
v120 = LSMASHVideoSource(dst_dir + "v120f.mp4").ConvertToYV24()
b_ex = undefined
v120o = v120
v120 = v120.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v120i = v120
v120 = expr(v120.extractY, v120.extractU, v120.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v120 = v120.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v120a = v120i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v120i.interleave(v120).hist_levels.prefetch
v120 = v120.adjustSize
v120 = v120.assumeFPS(18)
v120 = v120.add_blank_audio
return v120.prefetch
#adjustframerate
