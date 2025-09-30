import("..\1977-1979.avs")
v150 = LSMASHVideoSource(dst_dir + "v150f.mp4").ConvertToYV24()
b_ex = undefined
v150o = v150
v150 = v150.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 149. - 149. / * 149. * 149. +"
ex_v = "z" #ex_uv + "z 149. - 149. / * 149. * 149. +"
v150i = v150
v150 = expr(v150.extractY, v150.extractU, v150.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v150 = v150.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v150a = v150i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v150 = v150.colorYUV(off_u = +2, off_v = -0)
#return v150i.interleave(v150).hist_levels.prefetch
v150 = v150.adjustSize
v150 = v150.assumeFPS(18)
v150 = v150.add_blank_audio
return v150.prefetch
#adjustframerate
