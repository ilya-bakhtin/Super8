import("..\1981-1982-Kemerovo.avs")
v20 = LSMASHVideoSource(dst_dir + "v20f.mp4").ConvertToYV24()
v20o = v20
b_ex = undefined
#return v20.histogram.prefetch
v20 = v20.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v20i = v20
v20 = expr(v20.extractY, v20.extractU, v20.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v20 = v20.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v20a = v20i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v20o.interleave(v20).hist_levels
v20 = v20.adjustSize
v20 = v20.assumeFPS(18)
v20 = v20.add_blank_audio
return v20.prefetch
#adjustframerate
