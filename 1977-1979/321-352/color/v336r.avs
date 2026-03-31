import("..\1977-1979.avs")
v336 = LSMASHVideoSource(dst_dir + "v336f.mp4").ConvertToYV24()
b_ex = undefined
v336o = v336
v336 = v336.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v336i = v336
v336 = expr(v336.extractY, v336.extractU, v336.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v336 = v336.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v336a = v336i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v336i.interleave(v336).hist_levels.prefetch
v336 = v336.adjustSize
v336 = v336.assumeFPS(18)
v336 = v336.add_blank_audio
return v336.prefetch
#adjustframerate
