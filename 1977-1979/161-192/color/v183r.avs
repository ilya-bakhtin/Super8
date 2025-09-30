import("..\1977-1979.avs")
v183 = LSMASHVideoSource(dst_dir + "v183f.mp4").ConvertToYV24()
b_ex = undefined
v183o = v183
v183 = v183.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v183i = v183
v183 = expr(v183.extractY, v183.extractU, v183.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v183 = v183.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v183a = v183i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v183 = v183.colorYUV(off_u = -10, off_v = -4)
#return v183i.interleave(v183).hist_levels.prefetch
v183 = v183.adjustSize
v183 = v183.assumeFPS(18)
v183 = v183.add_blank_audio
return v183.prefetch
#adjustframerate
