import("..\1981-1982-Kemerovo.avs")
v80 = LSMASHVideoSource(dst_dir + "v80f.mp4").ConvertToYV24()
b_ex = undefined
v80o = v80
v80 = v80.AdjustColor(ou = +3, ov = -1, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v80i = v80
v80 = expr(v80.extractY, v80.extractU, v80.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v80 = v80.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v80a = v80i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v80 = v80.colorYUV(off_u = -2, off_v = -0)
v80 = v80.adjustSize
v80 = v80.assumeFPS(18)
v80 = v80.add_blank_audio
return v80.prefetch
#adjustframerate
