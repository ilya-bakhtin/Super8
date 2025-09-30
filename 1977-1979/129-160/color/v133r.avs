import("..\1977-1979.avs")
v133 = LSMASHVideoSource(dst_dir + "v133f.mp4").ConvertToYV24()
b_ex = undefined
v133o = v133
#return v133.histogram.prefetch
v133 = v133.AdjustColor(ou = +8, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)#,\
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 133. - 133. / * 133. * 133. +"
ex_v = "z" #ex_uv + "z 133. - 133. / * 133. * 133. +"
v133i = v133
v133 = expr(v133.extractY, v133.extractU, v133.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v133 = v133.autolevels(filterRadius=9, minRng=0, ignore_low=0.009, ignore_high=0.0003, gamma=1.)
v133a = v133i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v133 = v133.colorYUV(off_u = -2, off_v = -2)
#return v133.hist_levels.prefetch
#return v133i.interleave(v133).hist_levels.prefetch
v133 = v133.adjustSize
v133 = v133.assumeFPS(18)
v133 = v133.add_blank_audio
return v133.prefetch
#adjustframerate
