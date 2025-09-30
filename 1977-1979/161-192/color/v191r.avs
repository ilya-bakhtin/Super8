import("..\1977-1979.avs")
v191 = LSMASHVideoSource(dst_dir + "v191f.mp4").ConvertToYV24()
b_ex = undefined
v191o = v191
v191 = v191.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.15 P0^ 0.9 P1^ 1. 2.5 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v191i = v191
v191 = expr(v191.extractY, v191.extractU, v191.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v191 = v191.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v191a = v191i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v191 = v191.colorYUV(off_u = -8, off_v = -4)
#return v191i.interleave(v191).hist_levels.prefetch
v191 = v191.adjustSize
v191 = v191.assumeFPS(18)
v191 = v191.add_blank_audio
return v191.prefetch
#adjustframerate
