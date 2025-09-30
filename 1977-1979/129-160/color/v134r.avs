import("..\1977-1979.avs")
v134 = LSMASHVideoSource(dst_dir + "v134f.mp4").ConvertToYV24()
#v134 = v134.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 235, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v134o = v134
#return v134.histogram.prefetch
v134 = v134.AdjustColor(ou = +12, ov = -4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)#,\
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 134. - 134. / * 134. * 134. +"
ex_v = "z" #ex_uv + "z 134. - 134. / * 134. * 134. +"
v134i = v134
v134 = expr(v134.extractY, v134.extractU, v134.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v134 = v134.autolevels(filterRadius=9, minRng=0, ignore_low=0.009, ignore_high=0.0003, gamma=1.)
v134a = v134i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v134 = v134.colorYUV(off_u = -2, off_v = -2)
#return v134i.interleave(v134).hist_levels.prefetch
v134 = v134.adjustSize
v134 = v134.assumeFPS(18)
v134 = v134.add_blank_audio
return v134.prefetch
#adjustframerate
