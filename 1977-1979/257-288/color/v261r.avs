import("..\1977-1979.avs")
v261 = LSMASHVideoSource(dst_dir + "v261f.mp4").ConvertToYV24()
b_ex = undefined
v261o = v261
v261 = v261.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v261i = v261
v261 = expr(v261.extractY, v261.extractU, v261.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v261 = v261.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v261a = v261i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v261i.interleave(v261).hist_levels.prefetch
v261 = v261.adjustSize
v261 = v261.assumeFPS(18)
v261 = v261.add_blank_audio
return v261.prefetch
#adjustframerate
