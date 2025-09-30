import("..\1977-1979.avs")
v187 = LSMASHVideoSource(dst_dir + "v187f.mp4").ConvertToYV24()
b_ex = undefined
v187o = v187
v187 = v187.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.1 / G0^ 1.9 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v187i = v187
v187 = expr(v187.extractY, v187.extractU, v187.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v187 = v187.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v187a = v187i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v187 = v187.colorYUV(off_u = -6, off_v = -4)
#return v187i.interleave(v187).hist_levels.prefetch
v187 = v187.adjustSize
v187 = v187.assumeFPS(18)
v187 = v187.add_blank_audio
return v187.prefetch
#adjustframerate
