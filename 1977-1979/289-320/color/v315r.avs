import("..\1977-1979.avs")
v315 = LSMASHVideoSource(dst_dir + "v315f.mp4").ConvertToYV24()
b_ex = undefined
v315o = v315
v315 = v315.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v315i = v315
v315 = expr(v315.extractY, v315.extractU, v315.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v315 = v315.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v315a = v315i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v315i.interleave(v315).hist_levels.prefetch
v315 = v315.adjustSize
v315 = v315.assumeFPS(18)
v315 = v315.add_blank_audio
return v315.prefetch
#adjustframerate
