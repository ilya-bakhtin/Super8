import("..\1981-1982-Kemerovo.avs")
v169 = LSMASHVideoSource(dst_dir + "v169f.mp4").ConvertToYV24()
b_ex = undefined
v169o = v169
v169 = v169.AdjustColor(ou = -4, ov = -0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v169i = v169
v169 = expr(v169.extractY, v169.extractU, v169.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v169 = v169.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v169a = v169i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v169 = v169.colorYUV(off_u = +2, off_v = -0)
#return v169i.interleave(v169).hist_levels.prefetch
v169 = v169.adjustSize
v169 = v169.assumeFPS(18)
v169 = v169.add_blank_audio
return v169.prefetch
#adjustframerate
