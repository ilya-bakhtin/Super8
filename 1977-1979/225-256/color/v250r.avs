import("..\1977-1979.avs")
v250 = LSMASHVideoSource(dst_dir + "v250f.mp4").ConvertToYV24()
b_ex = undefined
v250o = v250
v250 = v250.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v250i = v250
v250 = expr(v250.extractY, v250.extractU, v250.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v250 = v250.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v250a = v250i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v250i.interleave(v250).hist_levels.prefetch
v250 = v250.adjustSize
v250 = v250.assumeFPS(18)
v250 = v250.add_blank_audio
return v250.prefetch
#adjustframerate
