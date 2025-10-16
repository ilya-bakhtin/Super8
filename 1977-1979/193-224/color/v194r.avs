import("..\1977-1979.avs")
v194 = LSMASHVideoSource(dst_dir + "v194f.mp4").ConvertToYV24()
b_ex = undefined
v194o = v194
v194 = v194.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v194i = v194
v194 = expr(v194.extractY, v194.extractU, v194.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v194 = v194.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v194a = v194i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v194 = v194.colorYUV(off_u = -10, off_v = -0)
#return v194i.interleave(v194).hist_levels.prefetch
v194 = v194.adjustSize
v194 = v194.assumeFPS(18)
v194 = v194.add_blank_audio
return v194.prefetch
#adjustframerate
