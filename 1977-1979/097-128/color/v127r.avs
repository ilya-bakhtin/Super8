import("..\1977-1979.avs")
v127 = LSMASHVideoSource(dst_dir + "v127f.mp4").ConvertToYV24()
v127 = v127.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v127o = v127
v127 = v127.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v127i = v127
v127 = expr(v127.extractY, v127.extractU, v127.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v127 = v127.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v127a = v127i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v127i.interleave(v127).hist_levels.prefetch
v127 = v127.adjustSize
v127 = v127.assumeFPS(18)
v127 = v127.add_blank_audio
return v127.prefetch
#adjustframerate
