import("..\1977-1979.avs")
v273 = LSMASHVideoSource(dst_dir + "v273f.mp4").ConvertToYV24()
b_ex = undefined
v273o = v273
v273 = v273.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v273i = v273
v273 = expr(v273.extractY, v273.extractU, v273.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v273 = v273.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v273a = v273i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v273i.interleave(v273).hist_levels.prefetch
v273 = v273.adjustSize
v273 = v273.assumeFPS(18)
v273 = v273.add_blank_audio
return v273.prefetch
#adjustframerate
