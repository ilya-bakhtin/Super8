import("..\1977-1979.avs")
v123 = LSMASHVideoSource(dst_dir + "v123f.mp4").ConvertToYV24()
b_ex = undefined
v123o = v123
v123 = v123.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v123i = v123
v123 = expr(v123.extractY, v123.extractU, v123.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v123 = v123.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v123a = v123i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v123i.interleave(v123).hist_levels.prefetch
v123 = v123.adjustSize
v123 = v123.assumeFPS(18)
v123 = v123.add_blank_audio
return v123.prefetch
#adjustframerate
