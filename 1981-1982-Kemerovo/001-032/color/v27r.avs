import("..\1981-1982-Kemerovo.avs")
v27 = LSMASHVideoSource(dst_dir + "v27f.mp4").ConvertToYV24()
v27o = v27
b_ex = undefined
#return v27.histogram.prefetch
v27 = v27.AdjustColor(ou = +0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v27 = expr(v27.extractY, v27.extractU, v27.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v27i = v27
v27 = expr(v27.extractY, v27.extractU, v27.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v27 = v27.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v27a = v27i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v27o.interleave(v27).hist_levels
v27 = v27.adjustSize
v27 = v27.assumeFPS(18)
v27 = v27.add_blank_audio
return v27.prefetch
#adjustframerate
