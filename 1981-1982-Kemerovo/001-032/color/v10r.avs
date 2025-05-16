import("..\1981-1982-Kemerovo.avs")
v10 = LSMASHVideoSource(dst_dir + "v10f.mp4").ConvertToYV24()
b_ex = undefined
v10 = v10.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#                             V < P0 ? (V ^ G0) : (V > P1 ? (V ^ G1) : (V - P0) * D + P0)
#                     1     1 1     1      2      3      4      5   5     5 4 3     3    3
v10i = v10
v10 = expr(v10.extractY, v10.extractU, v10.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v10 = v10.autolevels(filterRadius=0, minRng=0, ignore_low=0.03, ignore_high=0.003, gamma=1.3)
v10a = v10i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v10 = v10.colorYUV(off_u = +4, off_v = -4)
v10 = v10.adjustSize
v10 = v10.assumeFPS(18)
v10 = v10.add_blank_audio
return v10.prefetch
#adjustframerate
