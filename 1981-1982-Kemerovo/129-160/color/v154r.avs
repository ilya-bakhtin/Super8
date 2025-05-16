import("..\1981-1982-Kemerovo.avs")
v154 = LSMASHVideoSource(dst_dir + "v154f.mp4").ConvertToYV24()
b_ex = undefined
v154o = v154
v154 = v154.AdjustColor(ou = +2, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v154i = v154
v154 = expr(v154.extractY, v154.extractU, v154.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v154 = v154.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v154a = v154i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v154 = v154.colorYUV(off_u = -2, off_v = -2)
v154 = v154.adjustSize
v154 = v154.assumeFPS(18)
v154 = v154.add_blank_audio
return v154.prefetch
#adjustframerate
