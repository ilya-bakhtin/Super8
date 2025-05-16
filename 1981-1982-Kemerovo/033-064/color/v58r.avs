import("..\1981-1982-Kemerovo.avs")
v58 = LSMASHVideoSource(dst_dir + "v58f.mp4").ConvertToYV24()
b_ex = undefined
#return v58.histogram.prefetch
v58o = v58
v58 = v58.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v58.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v58i = v58
v58 = expr(v58.extractY, v58.extractU, v58.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v58 = v58.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v58a = v58i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v58 = v58.colorYUV(off_u = -4, off_v = +0)
#return v58o.interleave(v58).hist_levels
v58 = v58.adjustSize
v58 = v58.assumeFPS(18)
v58 = v58.add_blank_audio
return v58.prefetch
#adjustframerate
