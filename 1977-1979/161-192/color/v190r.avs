import("..\1977-1979.avs")
v190 = LSMASHVideoSource(dst_dir + "v190f.mp4").ConvertToYV24()
b_ex = undefined
v190o = v190
v190 = v190.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.15 P0^ 0.9 P1^ 1. 2.5 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v190i = v190
v190 = expr(v190.extractY, v190.extractU, v190.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v190 = v190.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v190a = v190i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v190 = v190.colorYUV(off_u = -6, off_v = -2)
#return v190i.interleave(v190).hist_levels.prefetch
v190 = v190.adjustSize
v190 = v190.assumeFPS(18)
v190 = v190.add_blank_audio
return v190.prefetch
#adjustframerate
