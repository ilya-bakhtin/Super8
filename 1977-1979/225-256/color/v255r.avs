import("..\1977-1979.avs")
v255 = LSMASHVideoSource(dst_dir + "v255f.mp4").ConvertToYV24()
b_ex = undefined
v255o = v255
v255 = v255.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.3 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v255i = v255
v255 = expr(v255.extractY, v255.extractU, v255.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v255 = v255.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v255a = v255i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v255i.interleave(v255).hist_levels.prefetch
v255 = v255.adjustSize
v255 = v255.assumeFPS(18)
v255 = v255.add_blank_audio
return v255.prefetch
#adjustframerate
