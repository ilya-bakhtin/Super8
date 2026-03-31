import("..\1977-1979.avs")
v231 = LSMASHVideoSource(dst_dir + "v231f.mp4").ConvertToYV24()
b_ex = undefined
v231o = v231
v231 = v231.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.7, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v231i = v231
v231 = expr(v231.extractY, v231.extractU, v231.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v231 = v231.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v231a = v231i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#return v231i.interleave(v231).hist_levels.prefetch
v231 = v231.adjustSize
v231 = v231.assumeFPS(18)
v231 = v231.add_blank_audio
return v231.prefetch
#adjustframerate
