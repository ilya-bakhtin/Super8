import("..\1981-1982-Kemerovo.avs")
v35 = LSMASHVideoSource(dst_dir + "v35f.mp4").ConvertToYV24()
b_ex = undefined
#return v35.histogram.prefetch
v35o = v35
v35 = v35.AdjustColor(ou = +2, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
#return v35.hist_levels.prefetch
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v35i = v35
v35 = expr(v35.extractY, v35.extractU, v35.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v35 = v35.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.2)
v35a = v35i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=2.)
#return v35o.interleave(v35).hist_levels
v35 = v35.adjustSize
v35 = v35.assumeFPS(18)
v35 = v35.add_blank_audio
return v35.prefetch
#adjustframerate
