import("..\1981-1982-Kemerovo.avs")
v26 = LSMASHVideoSource(dst_dir + "v26f.mp4").ConvertToYV24()
b_ex = undefined
#return v26.histogram.prefetch
v26 = v26.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v26i = v26
v26 = expr(v26.extractY, v26.extractU, v26.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v26 = v26.autolevels(filterRadius=0, minRng=0, ignore_low=0.012, ignore_high=0.003, gamma=1.3)
v26a = v26i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v26 = v26.adjustSize
v26 = v26.assumeFPS(18)
v26 = v26.add_blank_audio
return v26.prefetch
#adjustframerate
