import("..\1981-1982-Kemerovo.avs")
v41 = LSMASHVideoSource(dst_dir + "v41f.mp4").ConvertToYV24()
b_ex = undefined
#return v41.histogram.prefetch
v41o = v41
v41 = v41.AdjustColor(ou = +6, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v41.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v41i = v41
v41 = expr(v41.extractY, v41.extractU, v41.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v41 = v41.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v41a = v41i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v41 = v41.colorYUV(off_u = -4, off_v = +2)
#return v41o.interleave(v41).hist_levels
v41 = v41.adjustSize
v41 = v41.assumeFPS(18)
v41 = v41.add_blank_audio
return v41.prefetch
#adjustframerate
