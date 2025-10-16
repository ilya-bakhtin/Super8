import("..\1977-1979.avs")
v218 = LSMASHVideoSource(dst_dir + "v218f.mp4").ConvertToYV24()
b_ex = undefined
v218o = v218
v218 = v218.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v218i = v218
v218 = expr(v218.extractY, v218.extractU, v218.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v218 = v218.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v218a = v218i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v218i.interleave(v218).hist_levels.prefetch
v218 = v218.adjustSize
v218 = v218.assumeFPS(18)
v218 = v218.add_blank_audio
return v218.prefetch
#adjustframerate
