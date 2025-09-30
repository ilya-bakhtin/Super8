import("..\1977-1979.avs")
v145 = LSMASHVideoSource(dst_dir + "v145f.mp4").ConvertToYV24()
b_ex = undefined
v145o = v145
v145 = v145.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 144. - 144. / * 144. * 144. +"
ex_v = "z" #ex_uv + "z 144. - 144. / * 144. * 144. +"
v145i = v145
v145 = expr(v145.extractY, v145.extractU, v145.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v145 = v145.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v145a = v145i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v145 = v145.colorYUV(off_u = -2, off_v = -0)
#return v145i.interleave(v145).hist_levels.prefetch
v145 = v145.adjustSize
v145 = v145.assumeFPS(18)
v145 = v145.add_blank_audio
return v145.prefetch
#adjustframerate
