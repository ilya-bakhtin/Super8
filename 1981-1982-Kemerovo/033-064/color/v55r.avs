import("..\1981-1982-Kemerovo.avs")
v55 = LSMASHVideoSource(dst_dir + "v55f.mp4").ConvertToYV24()
b_ex = undefined
#return v55.histogram.prefetch
v55o = v55
v55 = v55.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v55.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v55i = v55
v55 = expr(v55.extractY, v55.extractU, v55.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v55 = v55.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v55a = v55i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v55 = v55.colorYUV(off_u = -10, off_v = +2)
#return v55o.interleave(v55).hist_levels
v55 = v55.adjustSize
v55 = v55.assumeFPS(18)
v55 = v55.add_blank_audio
return v55.prefetch
#adjustframerate
