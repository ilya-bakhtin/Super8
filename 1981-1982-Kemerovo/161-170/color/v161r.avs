import("..\1981-1982-Kemerovo.avs")
v161 = LSMASHVideoSource(dst_dir + "v161f.mp4").ConvertToYV24()
b_ex = undefined
v161o = v161
v161 = v161.AdjustColor(ou = -6, ov = +4, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v161i = v161
v161 = expr(v161.extractY, v161.extractU, v161.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v161 = v161.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v161a = v161i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v161i.interleave(v161).hist_levels.prefetch
v161 = v161.adjustSize
v161 = v161.assumeFPS(18)
v161 = v161.add_blank_audio
return v161.prefetch
#adjustframerate
