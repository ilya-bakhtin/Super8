import("..\1977-1979.avs")
v353 = LSMASHVideoSource(dst_dir + "v353f.mp4").ConvertToYV24()
b_ex = undefined
v353o = v353
v353 = v353.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v353i = v353
v353 = expr(v353.extractY, v353.extractU, v353.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v353 = v353.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v353a = v353i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v353i.interleave(v353).hist_levels.prefetch
v353 = v353.adjustSize
v353 = v353.assumeFPS(18)
v353 = v353.add_blank_audio
return v353.prefetch
#adjustframerate
