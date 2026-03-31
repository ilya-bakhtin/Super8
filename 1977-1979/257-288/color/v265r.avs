import("..\1977-1979.avs")
v265 = LSMASHVideoSource(dst_dir + "v265f.mp4").ConvertToYV24()
b_ex = undefined
v265o = v265
v265 = v265.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v265i = v265
v265 = expr(v265.extractY, v265.extractU, v265.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v265 = v265.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v265a = v265i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v265i.interleave(v265).hist_levels.prefetch
v265 = v265.adjustSize
v265 = v265.assumeFPS(18)
v265 = v265.add_blank_audio
return v265.prefetch
#adjustframerate
