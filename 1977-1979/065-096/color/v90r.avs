import("..\1977-1979.avs")
v90 = LSMASHVideoSource(dst_dir + "v90f.mp4").ConvertToYV24()
b_ex = undefined
v90o = v90
v90 = v90.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v90i = v90
v90 = expr(v90.extractY, v90.extractU, v90.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v90 = v90.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v90a = v90i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v90i.interleave(v90).hist_levels.prefetch
v90 = v90.adjustSize
v90 = v90.assumeFPS(18)
v90 = v90.add_blank_audio
return v90.prefetch
#adjustframerate
