import("..\1981-1982-Kemerovo.avs")
v93 = LSMASHVideoSource(dst_dir + "v93f.mp4").ConvertToYV24()
b_ex = undefined
v93o = v93
v93 = v93.AdjustColor(ou = +3, ov = +3, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v93i = v93
v93 = expr(v93.extractY, v93.extractU, v93.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v93 = v93.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v93a = v93i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v93 = v93.colorYUV(off_u = -2, off_v = -2)
v93 = v93.adjustSize
v93 = v93.assumeFPS(18)
v93 = v93.add_blank_audio
return v93.prefetch
#adjustframerate
