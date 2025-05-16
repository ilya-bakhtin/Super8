import("..\1981-1982-Kemerovo.avs")
v33 = LSMASHVideoSource(dst_dir + "v33f.mp4").ConvertToYV24()
v33 = v33.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 250, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v33.histogram.prefetch
v33o = v33
v33 = v33.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v33i = v33
v33 = expr(v33.extractY, v33.extractU, v33.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v33 = v33.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v33a = v33i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
v33 = v33.adjustSize
v33 = v33.assumeFPS(18)
v33 = v33.add_blank_audio
return v33.prefetch
#adjustframerate
