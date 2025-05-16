import("..\1981-1982-Kemerovo.avs")
v50 = LSMASHVideoSource(dst_dir + "v50f.mp4").ConvertToYV24()
b_ex = undefined
#return v50.histogram.prefetch
v50o = v50
v50 = v50.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v50.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v50i = v50
v50 = expr(v50.extractY, v50.extractU, v50.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v50 = v50.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v50a = v50i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v50 = v50.colorYUV(off_u = -10, off_v = +2)
#return v50o.interleave(v50).hist_levels
v50 = v50.adjustSize
v50 = v50.assumeFPS(18)
v50 = v50.add_blank_audio
return v50.prefetch
#adjustframerate
