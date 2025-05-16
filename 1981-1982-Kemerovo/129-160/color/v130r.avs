import("..\1981-1982-Kemerovo.avs")
v130 = LSMASHVideoSource(dst_dir + "v130f.mp4").ConvertToYV24()
b_ex = undefined
v130o = v130
v130 = v130.AdjustColor(ou = -0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.4, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.2 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v130i = v130
v130 = expr(v130.extractY, v130.extractU, v130.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v130 = v130.autolevels(filterRadius=9, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v130a = v130i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v130i.interleave(v130).hist_levels.prefetch
v130 = v130.adjustSize
v130 = v130.assumeFPS(18)
v130 = v130.add_blank_audio
return v130.prefetch
#adjustframerate
