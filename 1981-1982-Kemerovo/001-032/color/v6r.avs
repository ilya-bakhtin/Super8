import("..\1981-1982-Kemerovo.avs")
v6 = LSMASHVideoSource(dst_dir + "v6f.mp4").ConvertToYV24()
b_ex = undefined
v6 = v6.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v6 = expr(v6.extractY, v6.extractU, v6.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v6i = v6
v6 = expr(v6.extractY, v6.extractU, v6.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v6 = v6.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.5)
v6a = v6i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v6 = v6.adjustSize
v6 = v6.assumeFPS(18)
v6 = v6.add_blank_audio
return v6.prefetch
#adjustframerate
