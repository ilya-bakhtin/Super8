import("..\1977-1979.avs")
v105 = LSMASHVideoSource(dst_dir + "v105f.mp4").ConvertToYV24()
b_ex = undefined
v105o = v105
v105 = v105.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v105i = v105
v105 = expr(v105.extractY, v105.extractU, v105.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v105 = v105.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v105a = v105i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v105i.interleave(v105).hist_levels.prefetch
v105 = v105.adjustSize
v105 = v105.assumeFPS(18)
v105 = v105.add_blank_audio
return v105.prefetch
#adjustframerate
