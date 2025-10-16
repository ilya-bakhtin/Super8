import("..\1977-1979.avs")
v210 = LSMASHVideoSource(dst_dir + "v210f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v210o = v210
v210 = v210.AdjustColor(ou = +0, ov = +0, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 128. * 128. + gy^ V 0.01 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 128. * 128. + gz^ V 0.01 > gz z ?"
v210i = v210
v210 = expr(v210.extractY, v210.extractU, v210.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v210 = v210.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v210a = v210i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
v210 = v210.colorYUV(off_u = -2, off_v = +2)
#return v210i.interleave(v210).hist_levels.prefetch
v210 = v210.adjustSize
v210 = v210.assumeFPS(18)
v210 = v210.add_blank_audio
return v210.prefetch
#adjustframerate
