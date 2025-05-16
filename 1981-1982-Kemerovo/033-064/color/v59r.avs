import("..\1981-1982-Kemerovo.avs")
v59 = LSMASHVideoSource(dst_dir + "v59f.mp4").ConvertToYV24()
b_ex = undefined
#return v59.histogram.prefetch
v59o = v59
v59 = v59.AdjustColor(ou = +10, ov = -2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.1, gam_mac=true, b_expr=b_ex)
#return v59.hist_levels.prefetch
ex_pfx = "0.08 P0^ 0.9 P1^ 1. 2. / G0^ 2. G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v59i = v59
v59 = expr(v59.extractY, v59.extractU, v59.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v59 = v59.autolevels(filterRadius=0, minRng=0, ignore_low=0.02, ignore_high=0.0003, gamma=1.)
v59a = v59i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v59 = v59.colorYUV(off_u = -4, off_v = +0)
#return v59o.interleave(v59).hist_levels
v59 = v59.adjustSize
v59 = v59.assumeFPS(18)
v59 = v59.add_blank_audio
return v59.prefetch
#adjustframerate
