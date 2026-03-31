import("..\1977-1979.avs")
v257 = LSMASHVideoSource(dst_dir + "v257f.mp4").ConvertToYV24()
b_ex = undefined
v257o = v257
v257 = v257.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2.1 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 219. * 16. +"
ex_uv = ex_pfx + "x 16. - 219. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
#ex_u = ex_uv + "y 128. - 128. / * 128. * 128. +"
#ex_v = ex_uv + "z 128. - 128. / * 128. * 128. +"
v257i = v257
v257 = v257.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v257 = expr(v257.extractY, v257.extractU, v257.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v257 = v257.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v257a = v257i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v257i.interleave(v257).hist_levels.prefetch
v257 = v257.adjustSize
v257 = v257.assumeFPS(18)
v257 = v257.add_blank_audio
return v257.prefetch
#adjustframerate
