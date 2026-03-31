import("..\1977-1979.avs")
v335 = LSMASHVideoSource(dst_dir + "v335f.mp4").ConvertToYV24()
b_ex = undefined
v335o = v335
v335 = v335.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.05 P0^ 0.95 P1^ 1. 1.2 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v335i = v335
v335 = expr(v335.extractY, v335.extractU, v335.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v335 = v335.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v335a = v335i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v335i.interleave(v335).hist_levels.prefetch
v335 = v335.adjustSize
v335 = v335.assumeFPS(18)
v335 = v335.add_blank_audio
return v335.prefetch
#adjustframerate
