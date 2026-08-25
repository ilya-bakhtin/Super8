import("..\1977-1979.avs")
v366 = LSMASHVideoSource(dst_dir + "v366f.mp4").ConvertToYV24()
b_ex = undefined
v366o = v366
v366 = v366.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 1.5 / 128. * 128. + gy^ V 0.03 > gy y ?"
ex_v = "z" #ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.03 > gz z ?"
v366i = v366
v366 = expr(v366.extractY, v366.extractU, v366.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v366 = v366.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v366a = v366i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v366i.interleave(v366).hist_levels.prefetch
v366 = v366.adjustSize
v366 = v366.assumeFPS(18)
v366 = v366.add_blank_audio
return v366.prefetch
#adjustframerate
