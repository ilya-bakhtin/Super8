import("..\1977-1979.avs")
v112 = LSMASHVideoSource(dst_dir + "v112f.mp4").ConvertToYV24()
v112 = v112.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v112o = v112
v112 = v112.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v112i = v112
v112 = expr(v112.extractY, v112.extractU, v112.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v112 = v112.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v112a = v112i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v112i.interleave(v112).hist_levels.prefetch
v112 = v112.adjustSize
v112 = v112.assumeFPS(18)
v112 = v112.add_blank_audio
return v112.prefetch
#adjustframerate
