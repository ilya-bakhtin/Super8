import("..\1977-1979.avs")
v184 = LSMASHVideoSource(dst_dir + "v184f.mp4").ConvertToYV24()
b_ex = undefined
v184o = v184
v184 = v184.AdjustColor(ou = +4, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.5 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v184i = v184
v184 = expr(v184.extractY, v184.extractU, v184.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v184 = v184.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.0003, gamma=1.)
v184a = v184i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v184 = v184.colorYUV(off_u = -10, off_v = -4)
#return v184i.interleave(v184).hist_levels.prefetch
v184 = v184.adjustSize
v184 = v184.assumeFPS(18)
v184 = v184.add_blank_audio
return v184.prefetch
#adjustframerate
