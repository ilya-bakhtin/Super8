import("..\1977-1979.avs")
v233 = LSMASHVideoSource(dst_dir + "v233f.mp4").ConvertToYV24()
b_ex = undefined
v233o = v233
v233 = v233.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v233i = v233
v233 = expr(v233.extractY, v233.extractU, v233.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v233 = v233.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v233a = v233i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v233i.interleave(v233).hist_levels.prefetch
v233 = v233.adjustSize
v233 = v233.assumeFPS(18)
v233 = v233.add_blank_audio
return v233.prefetch
#adjustframerate
