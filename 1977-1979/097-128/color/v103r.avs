import("..\1977-1979.avs")
v103 = LSMASHVideoSource(dst_dir + "v103f.mp4").ConvertToYV24()
b_ex = undefined
v103o = v103
v103 = v103.extractY.autoLevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003).convertToYV24
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v103i = v103
v103 = expr(v103.extractY, v103.extractU, v103.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v103 = v103.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v103a = v103i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v103i.interleave(v103).hist_levels.prefetch
v103 = v103.adjustSize
v103 = v103.assumeFPS(18)
v103 = v103.add_blank_audio
return v103.prefetch
#adjustframerate
