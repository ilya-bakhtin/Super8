import("..\1977-1979.avs")
v162 = LSMASHVideoSource(dst_dir + "v162f.mp4").ConvertToYV24()
b_ex = undefined
v162o = v162
v162 = v162.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v162i = v162
v162 = expr(v162.extractY, v162.extractU, v162.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v162 = v162.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v162a = v162i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v162 = v162.colorYUV(off_u = +2, off_v = -2)
#v162 = v162i
#return v162i.interleave(v162).hist_levels.prefetch
v162 = v162.adjustSize
v162 = v162.assumeFPS(18)
v162 = v162.add_blank_audio
return v162.prefetch
#adjustframerate
