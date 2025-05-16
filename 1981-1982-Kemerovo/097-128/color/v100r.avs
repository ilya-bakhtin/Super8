import("..\1981-1982-Kemerovo.avs")
v100 = LSMASHVideoSource(dst_dir + "v100f.mp4").ConvertToYV24()
b_ex = undefined
v100o = v100
v100 = v100.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1., gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v100i = v100
v100 = expr(v100.extractY, v100.extractU, v100.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v100 = v100.autolevels(filterRadius=0, minRng=0, ignore_low=0.001, ignore_high=0.0003, gamma=1.)
v100a = v100i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v100 = v100.adjustSize
v100 = v100.assumeFPS(18)
v100 = v100.add_blank_audio
return v100.prefetch
#adjustframerate
