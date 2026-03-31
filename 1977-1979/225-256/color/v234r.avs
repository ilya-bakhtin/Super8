import("..\1977-1979.avs")
v234 = LSMASHVideoSource(dst_dir + "v234f.mp4").ConvertToYV24()
b_ex = undefined
v234o = v234
v234 = v234.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.7 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v234i = v234
v234 = expr(v234.extractY, v234.extractU, v234.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v234 = v234.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v234a = v234i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v234 = v234.colorYUV(off_u = +2, off_v = -2)
#return v234i.interleave(v234).hist_levels.prefetch
v234 = v234.adjustSize
v234 = v234.assumeFPS(18)
v234 = v234.add_blank_audio
return v234.prefetch
#adjustframerate
