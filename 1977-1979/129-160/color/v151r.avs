import("..\1977-1979.avs")
v151 = LSMASHVideoSource(dst_dir + "v151f.mp4").ConvertToYV24()
b_ex = undefined
v151o = v151
v151 = v151.AdjustColor(ou = +2, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 150. - 150. / * 150. * 150. +"
ex_v = "z" #ex_uv + "z 150. - 150. / * 150. * 150. +"
v151i = v151
v151 = expr(v151.extractY, v151.extractU, v151.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v151 = v151.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v151a = v151i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v151 = v151.colorYUV(off_u = +2, off_v = -0)
#return v151i.interleave(v151).hist_levels.prefetch
v151 = v151.adjustSize
v151 = v151.assumeFPS(18)
v151 = v151.add_blank_audio
return v151.prefetch
#adjustframerate
