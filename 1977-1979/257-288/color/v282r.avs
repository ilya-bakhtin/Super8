import("..\1977-1979.avs")
v282 = LSMASHVideoSource(dst_dir + "v282f.mp4").ConvertToYV24()
b_ex = undefined
v282o = v282
v282 = v282.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v282i = v282
v282 = expr(v282.extractY, v282.extractU, v282.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v282 = v282.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v282a = v282i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v282i.interleave(v282).hist_levels.prefetch
v282 = v282.adjustSize
v282 = v282.assumeFPS(18)
v282 = v282.add_blank_audio
return v282.prefetch
#adjustframerate
