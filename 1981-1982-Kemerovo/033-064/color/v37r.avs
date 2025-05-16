import("..\1981-1982-Kemerovo.avs")
v37 = LSMASHVideoSource(dst_dir + "v37f.mp4").ConvertToYV24()
b_ex = undefined
#return v37.histogram.prefetch
v37o = v37
v37 = v37.AdjustColor(ou = +0, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.2, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.03 P0^ 0.95 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v37i = v37
v37 = expr(v37.extractY, v37.extractU, v37.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v37 = v37.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v37a = v37i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v37 = v37.colorYUV(off_u = +2, off_v = -2)
#return v37o.interleave(v37).hist_levels
v37 = v37.adjustSize
v37 = v37.assumeFPS(18)
v37 = v37.add_blank_audio
return v37.prefetch
#adjustframerate
