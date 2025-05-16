import("..\1977-1979.avs")
v92 = LSMASHVideoSource(dst_dir + "v92f.mp4").ConvertToYV24()
b_ex = undefined
v92o = v92
v92 = v92.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v92i = v92
v92 = expr(v92.extractY, v92.extractU, v92.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v92 = v92.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v92a = v92i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v92i.interleave(v92).hist_levels.prefetch
v92 = v92.adjustSize
v92 = v92.assumeFPS(18)
v92 = v92.add_blank_audio
return v92.prefetch
#adjustframerate
