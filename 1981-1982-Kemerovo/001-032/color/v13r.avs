import("..\1981-1982-Kemerovo.avs")
v13 = LSMASHVideoSource(dst_dir + "v13f.mp4").ConvertToYV24()
v13o = v13
b_ex = undefined
#return v13.histogram.prefetch
v13 = v13.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v13i = v13
v13 = expr(v13.extractY, v13.extractU, v13.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v13 = v13.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.3)
v13a = v13i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v13 = v13.colorYUV(off_u = +2, off_v = -2)
#return v13o.interleave(v13).hist_levels
v13 = v13.adjustSize
v13 = v13.assumeFPS(18)
v13 = v13.add_blank_audio
return v13.prefetch
#adjustframerate
