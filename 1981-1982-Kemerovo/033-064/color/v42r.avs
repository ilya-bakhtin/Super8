import("..\1981-1982-Kemerovo.avs")
v42 = LSMASHVideoSource(dst_dir + "v42f.mp4").ConvertToYV24()
b_ex = undefined
#return v42.histogram.prefetch
v42o = v42
#return v42.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v42i = v42
v42 = expr(v42.extractY, v42.extractU, v42.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v42 = v42.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v42a = v42i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v42 = v42.colorYUV(off_u = +18, off_v = -4)
#return v42o.interleave(v42).hist_levels
v42 = v42.adjustSize
v42 = v42.assumeFPS(18)
v42 = v42.add_blank_audio
return v42.prefetch
#adjustframerate
