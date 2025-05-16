import("..\1981-1982-Kemerovo.avs")
v23 = LSMASHVideoSource(dst_dir + "v23f.mp4").ConvertToYV24()
v23o = v23
b_ex = undefined
#return v23.histogram.prefetch
v23 = v23.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=0.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v23i = v23
v23 = expr(v23.extractY, v23.extractU, v23.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v23 = v23.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v23a = v23i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v23 = v23.colorYUV(off_u = +2, off_v = +2)
#return v23o.interleave(v23).hist_levels
v23 = v23.adjustSize
v23 = v23.assumeFPS(18)
v23 = v23.add_blank_audio
return v23.prefetch
#adjustframerate
