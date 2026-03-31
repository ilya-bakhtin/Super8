import("..\1977-1979.avs")
v268 = LSMASHVideoSource(dst_dir + "v268f.mp4").ConvertToYV24()
b_ex = undefined
v268o = v268
v268 = v268.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v268i = v268
v268 = expr(v268.extractY, v268.extractU, v268.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v268 = v268.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v268a = v268i.autolevels(filterRadius=0, minRng=0, ignore_low=0.093, ignore_high=0.003, gamma=1.3)
#return v268i.interleave(v268).hist_levels.prefetch
v268 = v268.adjustSize
v268 = v268.assumeFPS(18)
v268 = v268.add_blank_audio
return v268.prefetch
#adjustframerate
