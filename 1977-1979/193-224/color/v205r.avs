import("..\1977-1979.avs")
v205 = LSMASHVideoSource(dst_dir + "v205f.mp4").ConvertToYV24()
b_ex = undefined
v205o = v205
v205 = v205.AdjustColor(ou = -2, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.5, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v205i = v205
v205 = expr(v205.extractY, v205.extractU, v205.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v205 = v205.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v205a = v205i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v205 = v205.colorYUV(off_u = -2, off_v = -2)
#return v205i.interleave(v205).hist_levels.prefetch
v205 = v205.adjustSize
v205 = v205.assumeFPS(18)
v205 = v205.add_blank_audio
return v205.prefetch
#adjustframerate
