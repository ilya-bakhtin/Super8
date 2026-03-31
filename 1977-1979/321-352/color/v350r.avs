import("..\1977-1979.avs")
v350 = LSMASHVideoSource(dst_dir + "v350f.mp4").ConvertToYV24()
b_ex = undefined
v350o = v350
v350 = v350.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v350i = v350
v350 = expr(v350.extractY, v350.extractU, v350.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v350 = v350.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v350a = v350i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v350i.interleave(v350).hist_levels.prefetch
v350 = v350.adjustSize
v350 = v350.assumeFPS(18)
v350 = v350.add_blank_audio
return v350.prefetch
#adjustframerate
