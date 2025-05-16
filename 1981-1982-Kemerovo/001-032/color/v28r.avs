import("..\1981-1982-Kemerovo.avs")
v28 = LSMASHVideoSource(dst_dir + "v28f.mp4").ConvertToYV24()
v28o = v28
v28 = v28.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v28.histogram.prefetch
v28 = v28.AdjustColor(ou = +0, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=false, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v28i = v28
v28 = expr(v28.extractY, v28.extractU, v28.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v28 = v28.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.1)
v28a = v28i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#v28 = v28.colorYUV(off_u = -8, off_v = +0)
#return v28o.interleave(v28).hist_levels
v28 = v28.adjustSize
v28 = v28.assumeFPS(18)
v28 = v28.add_blank_audio
return v28.prefetch
#adjustframerate
