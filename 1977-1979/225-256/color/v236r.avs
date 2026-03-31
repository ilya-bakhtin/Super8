import("..\1977-1979.avs")
v236 = LSMASHVideoSource(dst_dir + "v236f.mp4").ConvertToYV24()
b_ex = undefined
v236o = v236
v236 = v236.AdjustColor(ou = +2, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=2.1, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 1.7 / G0^ 1.5 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
v236i = v236
v236 = expr(v236.extractY, v236.extractU, v236.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v236 = v236.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v236a = v236i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v236 = v236.colorYUV(off_u = +4, off_v = -4)
#return v236i.interleave(v236).hist_levels.prefetch
v236 = v236.adjustSize
v236 = v236.assumeFPS(18)
v236 = v236.add_blank_audio
return v236.prefetch
#adjustframerate
