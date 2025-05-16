import("..\1981-1982-Kemerovo.avs")
v25 = LSMASHVideoSource(dst_dir + "v25f.mp4").ConvertToYV24()
v25o = v25
v25 = v25.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v25.histogram.prefetch
v25 = v25.AdjustColor(ou = +2, ov = -6, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
#v25 = expr(v25.extractY, v25.extractU, v25.extractV, "x 16 - 220 / V@ 0.3 < V 0.4 ^ V 0.3 - 0.5 * 0.3 0.4 ^ + ? 220 * 16 +", "y", "z", format = "YUV444P8")
v25i = v25
v25 = expr(v25.extractY, v25.extractU, v25.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v25 = v25.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v25a = v25i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v25 = v25.colorYUV(off_u = +6, off_v = -0)
#return v25o.interleave(v25).hist_levels
v25 = v25.adjustSize
v25 = v25.assumeFPS(18)
v25 = v25.add_blank_audio
return v25.prefetch
#adjustframerate
