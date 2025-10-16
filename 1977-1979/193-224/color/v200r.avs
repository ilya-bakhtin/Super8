import("..\1977-1979.avs")
v200 = LSMASHVideoSource(dst_dir + "v200f.mp4").ConvertToYV24()
b_ex = undefined
v200o = v200
v200 = v200.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v200i = v200
v200 = expr(v200.extractY, v200.extractU, v200.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v200 = v200.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v200a = v200i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v200i.interleave(v200).hist_levels.prefetch
v200 = v200.adjustSize
v200 = v200.assumeFPS(18)
v200 = v200.add_blank_audio
return v200.prefetch
#adjustframerate
