import("..\1981-1982-Kemerovo.avs")
v166 = LSMASHVideoSource(dst_dir + "v166f.mp4").ConvertToYV24()
v166 = v166.autolevels(input_low = 0, output_low = 8, input_high = 247, output_high = 255, autolevel = false, filterRadius = 0, minRng = 0)
b_ex = undefined
v166o = v166
v166 = v166.AdjustColor(ou = -6, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.3, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 128. - 128. / * 128. * 128. +"
ex_v = "z" #ex_uv + "z 128. - 128. / * 128. * 128. +"
v166i = v166
v166 = expr(v166.extractY, v166.extractU, v166.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v166 = v166.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v166a = v166i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v166i.interleave(v166).hist_levels.prefetch
v166 = v166.adjustSize
v166 = v166.assumeFPS(18)
v166 = v166.add_blank_audio
return v166.prefetch
#adjustframerate
