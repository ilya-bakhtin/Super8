import("..\1977-1979.avs")
v137 = LSMASHVideoSource(dst_dir + "v137f.mp4").ConvertToYV24()
b_ex = undefined
#return v137.histogram.prefetch
v137o = v137
v137 = v137.AdjustColor(ou = +4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 137. - 137. / * 137. * 137. +"
ex_v = "z" #ex_uv + "z 137. - 137. / * 137. * 137. +"
v137i = v137
v137 = expr(v137.extractY, v137.extractU, v137.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v137 = v137.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v137a = v137i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v137 = v137.colorYUV(off_u = -2, off_v = -2)
#return v137i.interleave(v137).hist_levels.prefetch
v137 = v137.adjustSize
v137 = v137.assumeFPS(18)
v137 = v137.add_blank_audio
return v137.prefetch
#adjustframerate
