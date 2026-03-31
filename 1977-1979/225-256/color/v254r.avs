import("..\1977-1979.avs")
v254 = LSMASHVideoSource(dst_dir + "v254f.mp4").ConvertToYV24()
b_ex = undefined
v254o = v254
v254 = v254.AdjustColor(ou = -6, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.04, hi_th=0.0004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v254i = v254
#v254 = expr(v254.extractY, v254.extractU, v254.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v254 = v254.autolevels(filterRadius=9, minRng=0, ignore_low=0.03, ignore_high=0.0003, gamma=0.7)
v254a = v254i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v254 = v254i
#return v254i.interleave(v254).hist_levels.prefetch
v254 = v254.adjustSize
v254 = v254.assumeFPS(18)
v254 = v254.add_blank_audio
return v254.prefetch
#adjustframerate
