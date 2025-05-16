import("..\1977-1979.avs")
v107 = LSMASHVideoSource(dst_dir + "v107f.mp4").ConvertToYV24()
b_ex = undefined
v107o = v107
v107 = v107.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 1.0 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v107i = v107
v107 = expr(v107.extractY, v107.extractU, v107.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v107 = v107.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.009, gamma=1.)
v107a = v107i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v107i.interleave(v107).hist_levels.prefetch
v107 = v107.adjustSize
v107 = v107.assumeFPS(18)
v107 = v107.add_blank_audio
return v107.prefetch
#adjustframerate
