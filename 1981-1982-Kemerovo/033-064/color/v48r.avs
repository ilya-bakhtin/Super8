import("..\1981-1982-Kemerovo.avs")
v48 = LSMASHVideoSource(dst_dir + "v48f.mp4").ConvertToYV24()
v48 = v48.autolevels(input_low = 0, output_low = 16, input_high = 239, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
#return v48.histogram.prefetch
v48o = v48
v48 = v48.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v48.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v48i = v48
v48 = expr(v48.extractY, v48.extractU, v48.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v48 = v48.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v48a = v48i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v48 = v48.colorYUV(off_u = -10, off_v = +2)
#return v48o.interleave(v48).hist_levels
v48 = v48.adjustSize
v48 = v48.assumeFPS(18)
v48 = v48.add_blank_audio
return v48.prefetch
#adjustframerate
