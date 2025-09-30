import("..\1977-1979.avs")
v147 = LSMASHVideoSource(dst_dir + "v147f.mp4").ConvertToYV24()
b_ex = undefined
v147o = v147
v147 = v147.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 146. - 146. / * 146. * 146. +"
ex_v = "z" #ex_uv + "z 146. - 146. / * 146. * 146. +"
v147i = v147
v147 = expr(v147.extractY, v147.extractU, v147.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v147 = v147.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v147a = v147i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v147i.interleave(v147).hist_levels.prefetch
v147 = v147.adjustSize
v147 = v147.assumeFPS(18)
v147 = v147.add_blank_audio
return v147.prefetch
#adjustframerate
