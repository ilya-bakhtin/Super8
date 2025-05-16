import("..\1981-1982-Kemerovo.avs")
v34 = LSMASHVideoSource(dst_dir + "v34f.mp4").ConvertToYV24()
v34 = v34.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 245, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v34.histogram.prefetch
v34o = v34
v34 = v34.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
#return v34.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v34i = v34
v34 = expr(v34.extractY, v34.extractU, v34.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v34 = v34.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v34a = v34i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v34o.interleave(v34).hist_levels
v34 = v34.adjustSize
v34 = v34.assumeFPS(18)
v34 = v34.add_blank_audio
return v34.prefetch
#adjustframerate
