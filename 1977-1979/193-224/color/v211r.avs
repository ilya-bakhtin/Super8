import("..\1977-1979.avs")
v211 = LSMASHVideoSource(dst_dir + "v211f.mp4").ConvertToYV24()
b_ex = undefined
b_ex = "z x 1.1 * > z y 1.1 * > & x y + 2. / z ?"
v211o = v211
v211 = v211.AdjustColor(ou = +0, ov = +2, x=10, y=10, w=-10, h=-10, lo_th=0.004, hi_th=0.004, lock_chan=1, sat=1.9, gam_mac=true, b_expr=b_ex)
#v211 = v211.colorYUV(off_u = -2, off_v = +2)
ex_pfx = "0.1 P0^ 0.9 P1^ 1. 2.9 / G0^ 1.3 G1^ P0 G0 ^ VP0^ P1 G1 ^ VP1^ VP1 VP0 - D^ "
ex_y = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? 220. * 16. +"
ex_uv = ex_pfx + "x 16. - 220. / V@ P0 < V G0 ^ V P1 > V G1 ^ V P0 - D * P1 P0 - / VP0 + ? ? V / "
#ex_u = "y" #ex_uv + "y 160. - 160. / * 160. * 160. +"
#ex_v = "z" #ex_uv + "z 160. - 160. / * 160. * 160. +"
ex_u = ex_uv + "y 128. - 128. / * 2. / 128. * 128. + gy^ V 0.01 > gy y ?"
ex_v = ex_uv + "z 128. - 128. / * 1.5 / 128. * 128. + gz^ V 0.01 > gz z ?"
v211i = v211
v211 = expr(v211.extractY, v211.extractU, v211.extractV, ex_y, ex_u, ex_v, format = "YUV444P8")
v211 = v211.autolevels(filterRadius=9, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.)
v211a = v211i.autolevels(filterRadius=0, minRng=0, ignore_low=0.003, ignore_high=0.003, gamma=1.3)
#v211 = v211.colorYUV(off_u = -2, off_v = +2)
#return v211i.interleave(v211).hist_levels.prefetch
v211 = v211.adjustSize
v211 = v211.assumeFPS(18)
v211 = v211.add_blank_audio
return v211.prefetch
#adjustframerate
