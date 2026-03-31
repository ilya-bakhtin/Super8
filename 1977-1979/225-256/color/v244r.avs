import("..\1977-1979.avs")
v244 = LSMASHVideoSource(dst_dir + "v244f.mp4").ConvertToYV24()
b_ex = undefined
v244o = v244
v244 = v244.AdjustColor(ou = +1, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v244i = v244
v244 = expr(v244.extractY, v244.extractU, v244.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v244 = v244.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v244a = v244i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v244 = v244i
#return v244i.interleave(v244).hist_levels.prefetch
v244 = v244.adjustSize
v244 = v244.assumeFPS(18)
v244 = v244.add_blank_audio
return v244.prefetch
#adjustframerate
