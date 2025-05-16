import("..\1981-1982-Kemerovo.avs")
v139 = LSMASHVideoSource(dst_dir + "v139f.mp4").ConvertToYV24()
v139 = v139.autolevels(input_low = 0, output_low = 8, input_high = 255, output_high = 247, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v139o = v139
v139 = v139.AdjustColor(ou = -0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v139i = v139
v139 = expr(v139.extractY, v139.extractU, v139.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v139 = v139.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v139a = v139i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v139 = v139.colorYUV(off_u = -1, off_v = -1)
v139 = v139.adjustSize
v139 = v139.assumeFPS(18)
v139 = v139.add_blank_audio
return v139.prefetch
#adjustframerate
