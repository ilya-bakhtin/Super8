import("..\1977-1979.avs")
v208 = LSMASHVideoSource(dst_dir + "v208f.mp4").ConvertToYV24()
b_ex = undefined
v208o = v208
v208 = v208.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.9 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v208i = v208
v208 = expr(v208.extractY, v208.extractU, v208.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v208 = v208.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v208a = v208i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v208 = v208.colorYUV(off_u = -0, off_v = +4)
#return v208i.interleave(v208).hist_levels.prefetch
v208 = v208.adjustSize
v208 = v208.assumeFPS(18)
v208 = v208.add_blank_audio
return v208.prefetch
#adjustframerate
