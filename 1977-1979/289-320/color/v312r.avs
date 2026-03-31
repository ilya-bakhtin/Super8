import("..\1977-1979.avs")
v312 = LSMASHVideoSource(dst_dir + "v312f.mp4").ConvertToYV24()
b_ex = undefined
v312o = v312
v312 = v312.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v312i = v312
v312 = expr(v312.extractY, v312.extractU, v312.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v312 = v312.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v312a = v312i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v312i.interleave(v312).hist_levels.prefetch
v312 = v312.adjustSize
v312 = v312.assumeFPS(18)
v312 = v312.add_blank_audio
return v312.prefetch
#adjustframerate
