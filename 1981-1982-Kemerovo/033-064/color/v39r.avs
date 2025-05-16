import("..\1981-1982-Kemerovo.avs")
v39 = LSMASHVideoSource(dst_dir + "v39f.mp4").ConvertToYV24()
v39 = v39.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 240, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v39.histogram.prefetch
v39o = v39
v39 = v39.AdjustColor(ou = +0, ov = -0, x=400, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v39.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.94 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v39i = v39
v39 = expr(v39.extractY, v39.extractU, v39.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v39 = v39.autolevels(filterRadius=0, minRng=0, border_l = 400, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v39a = v39i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v39 = v39.colorYUV(off_u = -2, off_v = -2)
#return v39o.interleave(v39).hist_levels
v39 = v39.adjustSize
v39 = v39.assumeFPS(18)
v39 = v39.add_blank_audio
return v39.prefetch
#adjustframerate
