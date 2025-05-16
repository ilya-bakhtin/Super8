import("..\1981-1982-Kemerovo.avs")
v111 = LSMASHVideoSource(dst_dir + "v111f.mp4").ConvertToYV24()
b_ex = undefined
v111o = v111
v111 = v111.AdjustColor(ou = -2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v111i = v111
v111 = expr(v111.extractY, v111.extractU, v111.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v111 = v111.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v111a = v111i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v111 = v111.adjustSize
v111 = v111.assumeFPS(18)
v111 = v111.add_blank_audio
return v111.prefetch
#adjustframerate
