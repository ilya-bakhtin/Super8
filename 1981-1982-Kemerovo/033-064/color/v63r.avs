import("..\1981-1982-Kemerovo.avs")
v63 = LSMASHVideoSource(dst_dir + "v63f.mp4").ConvertToYV24()
b_ex = undefined
#return v63.histogram.prefetch
v63o = v63
v63 = v63.AdjustColor(ou = +4, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v63.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v63i = v63
v63 = expr(v63.extractY, v63.extractU, v63.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v63 = v63.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v63a = v63i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v63o.interleave(v63).hist_levels
v63 = v63.adjustSize
v63 = v63.assumeFPS(18)
v63 = v63.add_blank_audio
return v63.prefetch
#adjustframerate
